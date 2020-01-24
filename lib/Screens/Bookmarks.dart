import 'package:bern_hack_app/DemoData/database.dart';
import 'package:bern_hack_app/Screens/description.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Bookmarks extends StatefulWidget {

  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmarks", style: TextStyle(fontSize: 30,color: Colors.black,fontFamily: 'mainFont'),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              BookMarkedData.deleteBookmark();
              showSnackBar(context);
            },
            icon: Icon(Icons.delete_forever, color: Colors.black,),
          )
        ],
      ),

      body: FutureBuilder(
        future: BookMarkedData.getBookmarkedList(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            final fish = snapshot.data;
            List protoImages = [];
            List protoTitles = [];
            List protoDescription = [];
            List protoLocation = [];

            if(fish.length != 0) {
              for(int i = 0; i< fish.length; i++) {
                protoImages.add(fish[i]['image']);
                protoTitles.add(fish[i]['title']);
                protoDescription.add(fish[i]['description']);
                protoLocation.add(fish[i]['location']);
              }
            }
            return
              (fish.length != 0)?
              _buildBody(protoImages, protoTitles, fish.length,location: protoLocation, description: protoDescription):
              Center(child: Text('Nothing Here'),)
            ;
          }

          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }

  Widget _buildBody(List images, List title, count,{List location, List description}) {
    return Container(
      height: MediaQuery.of(context).size.height - 100.0,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: 300,
        itemCount: count,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Details(
                  description: description[index],
                  location: location[index],
                  title: title[index],
                  image: images[index],
                )
              ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/${images[index % images.length]}.jpg'),
                  fit: BoxFit.cover
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0
                  )
                ]
              ),
              height: MediaQuery.of(context).size.height - 200,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepPurple
                  ),
                  child: Text(
                    title[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'complementaryFont',
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  showSnackBar(BuildContext context) async {

    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      message: "Bookmarks Deleted !! ",
      backgroundColor: Colors.black,
      duration: Duration(milliseconds: 500),
    )
      ..show(context).then((r)=> Navigator.pop(context));
  }
}

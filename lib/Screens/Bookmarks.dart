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
        title: Text("BookMarks", style: TextStyle(color: Colors.black,fontFamily: 'mainFont'),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)
        ),
      ),

      body: _buildBody(['sikali','Kakani']),
    );
  }

  Widget _buildBody(List images) {
    return Container(
      height: MediaQuery.of(context).size.height ,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: 300,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10.0),
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
            child: Center(child: Text("Random Text"),)
          );
        },
      ),
    );
  }
}

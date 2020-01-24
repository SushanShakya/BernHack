import 'package:bern_hack_app/DemoData/demo_data.dart';
import 'package:bern_hack_app/Screens/Bookmarks.dart';
import 'package:bern_hack_app/Screens/DetailScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: "BernHack App",
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<Location> picnicSpots;
  List<Location> resorts;

  final PageController ctrl = new PageController(viewportFraction: 0.8);

  List<Location> _activeTag;

  int currentPage = 0;

  @override
  void initState() {
    var data = DemoData();
    picnicSpots = data.getPicnicSpots();
    resorts = data.getResorts();
    _activeTag = picnicSpots;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Your Destination", style: TextStyle(color:Colors.black,fontFamily: 'mainFont'),),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Bookmarks()
              ));
            },
            icon: Icon(Icons.book, color: Colors.black,),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: PageView.builder(
        onPageChanged: (data) {
          setState(() {
            currentPage = data;
          });
        },
        controller: ctrl,
          itemCount: _activeTag.length + 1,
          itemBuilder: (context, index) {
            bool active = index == currentPage;
            return
              (index == 0)?
              _buildMainHead()
            :
              _buildImageContainer(
                  context,
                  active: active,
                image: _activeTag[index-1].imageName,
                title: _activeTag[index -1 ].name,
                description: _activeTag[index -1 ].description,
                location: _activeTag[index -1 ].location,
//                images: ['${_activeTag[index-1].imageName[0]}'],
              )
            ;

          }
      )
    );
  }

  Widget _buildMainHead() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              setState(() {
                _activeTag = picnicSpots;
              });
            },
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/picnicSpots.png', height: 70, width: 70,),
                Text('PicnicSpots'),
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          MaterialButton(
            onPressed: () {
              setState(() {
                _activeTag = resorts;
              });
            },
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/chill.png', height: 70, width: 70,),
                Text('Resorts'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageContainer(context,
      {
        bool active,
//        @required List<String> images,
        String image,
        String title,
        String description,
        String location
      }
      ) {

    final double blur = active? 10:0;
    final double offset = active?3:0;
//    final double top = active? 40: 100;
    final double bottom = active?50: 100;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DescriptionPage(
                title: title,
                description: description,
                location: location,
                image: image,
              )
            )
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(top: 40, bottom: bottom, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/$image.jpg')
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: blur,
              offset: Offset(0.0,offset)
            ),
          ]
        ),
        child: Center(
          child: Container(
            color: Colors.teal,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}

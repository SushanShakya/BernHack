import 'package:bern_hack_app/DemoData/demo_data.dart';
import 'package:bern_hack_app/Screens/Bookmarks.dart';
import 'package:flutter/material.dart';
import 'Screens/DResort.dart';
import 'Screens/description.dart';

void main() => runApp(MaterialApp(
  title: "BernHack App",
  debugShowCheckedModeBanner: false,
//  theme: ThemeData(
//    buttonTheme: ButtonThemeData(
//      shape: BeveledRectangleBorder(
//        borderRadius: BorderRadius.circular(20.0)
//      )
//    )
//  ),
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

  bool isResort = false;

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
        title: Text(
          isResort?"Resorts":"Picnic Spots",
          style: TextStyle(fontSize: 30.0,color:Colors.black,fontFamily: 'mainFont'),),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
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
                images: _activeTag[index -1].images,
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
      width: 300,
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Choose Your Destination",style: TextStyle(fontSize: 30,color:Colors.black,fontFamily: 'mainFont'),),
          SizedBox(height: 20.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _makeButton(
                image: 'picnicSpots',
                  text: "#PicnicSpots",
                  onPressed: () {
                    setState(() {
                      _activeTag = picnicSpots;
                      isResort = false;
                    });
                  },
                color: isResort?Colors.transparent:Colors.teal
              ),
              SizedBox(height: 20.0,),
              _makeButton(
                image: 'chill',
                  text: "#Resorts",
                  onPressed: () {
                    setState(() {
                      _activeTag = resorts;
                      isResort = true;
                    });
                  },
                  color: isResort?Colors.teal:Colors.transparent
              ),
          SizedBox(height: 20.0,),
              _makeButton(
                  image: "bookmarks",
                  color: Colors.transparent,
                  text: "#BookMarks",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bookmarks()
                        )
                    );
                  }
                )
            ],
          ),
        ],
      ),
    );
  }

  Widget _makeButton({String image, String text, onPressed, color}) {
    return MaterialButton(
      color: color,
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            Image.asset('assets/images/$image.png', height: 70,width: 70,),
            Text(text,
            style: TextStyle(
              fontSize: 24
            ),)
          ],
        )
    );
  }

  Widget _buildImageContainer(context,
      {
        bool active,
        @required List<String> images,
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
              builder: (context) {
                return
                isResort?
                ResortDescription(
                  title: title,
                  images: images,
                  description: description,
                  location: location,
                ):
                Details(
                  image: image,
                  title: title,
                  description: description,
                  location: location,

                );
              }
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
        child:
            Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.deepPurple
                ),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
//                      fontFamily: 'complementaryFont',
                      color: Colors.white
                    ),
                  ),
                ),
            ),
      ),
    );
  }
}


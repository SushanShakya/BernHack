//import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
//
//class ResortDescription extends StatefulWidget {
//
//  final String title;
//  final String description;
//  final List<String> images;
//
//  const ResortDescription({Key key, @required this.title, this.description, this.images}) : super(key: key);
//
//  @override
//  _ResortDescriptionState createState() => _ResortDescriptionState();
//}
//
//class _ResortDescriptionState extends State<ResortDescription> {
//
//  int _currentIndex = 0;
//  final SwiperController _swiperController = SwiperController();
//
//  @override
//  Widget build(BuildContext context) {
//    int count = (widget.images).length;
////    List myColors = [Colors.orange,Colors.blue];
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title, style: TextStyle(color: Colors.black,fontFamily: 'mainFont'),),
//        centerTitle: true,
//        elevation: 0.0,
//        backgroundColor: Colors.white,
//        leading: GestureDetector(
//          onTap: (){
//            Navigator.pop(context);
//          },
//          child: Icon(Icons.arrow_back_ios, color: Colors.black,),
//        ),
//      ),
//
//      body: Stack(
//        children: <Widget>[
//          Container(
//            height: MediaQuery.of(context).size.height/ 1.5,
//            child: Swiper(
//              itemCount: count,
//              itemWidth: 300,
//              autoplay: true,
//              index: _currentIndex,
//              controller: _swiperController,
//              onIndexChanged: (index) {
//                setState(() {
//                  _currentIndex = index;
//                });
//              },
//              loop: true,
//              itemBuilder: (context,index) {
//                return imageContainer("${widget.images[index]}");
//              },
//            ),
//          ),
//
//          SingleChildScrollView(
//            child: Container(
//              padding: EdgeInsets.all(20.0),
//              margin: EdgeInsets.fromLTRB(10.0, MediaQuery.of(context).size.height - 250, 10.0, 1.0),
//              decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.black,
//                      blurRadius: 15.0,
//                    )
//                  ]
//              ),
//              child: Column(
//                children: <Widget>[
//                  Text(widget.title, style: Theme.of(context).textTheme.title,textAlign: TextAlign.left,),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Text(widget.location),
//                      IconButton(
//                        onPressed: () {
//                          print("presseed");
//                          setState(() {
//                            isSaved = (isSaved == true)? false:true;
//                          });
//                        },
//                        icon: Icon((isSaved == true)?Icons.favorite:Icons.favorite_border),
//                      )
//                    ],
//                  ),
//                  Divider(
//                    thickness: 2.0,
//                  ),
//                  Text("        ${widget.description}")
//                ],
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}

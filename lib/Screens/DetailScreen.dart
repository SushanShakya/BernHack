import 'package:bern_hack_app/CustomWidgets/myWidgets.dart';
import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {

  final String title;
  final String description;
  final String location;
  final String image;

  DescriptionPage({Key key,this.location, this.title ="Title", this.description ="Something", this.image}) : super(key: key);


  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {

  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.black,fontFamily: 'mainFont'),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
      ),
      body: Stack(
        children: <Widget>[
          BackgroundSwiper(
            images: widget.image,
          ),
          SingleChildScrollView(
            child: Container(
//        height: MediaQuery.of(context).size.height - 150,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.fromLTRB(10.0, MediaQuery.of(context).size.height - 250, 10.0, 1.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 15.0,
                    )
                  ]
              ),
              child: Column(
                children: <Widget>[
                  Text(widget.title, style: Theme.of(context).textTheme.title,textAlign: TextAlign.left,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.location),
                      IconButton(
                        onPressed: () {
                          print("presseed");
                          setState(() {
                            isSaved = (isSaved == true)? false:true;
                          });
                        },
                        icon: Icon((isSaved == true)?Icons.favorite:Icons.favorite_border),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                  Text("        ${widget.description}")
                ],
              ),
            ),
          )
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {},
            child: Text('Choose'),
          ),
        ),
      ),
    );
  }
}

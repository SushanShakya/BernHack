import 'package:flutter/material.dart';

class Details extends StatelessWidget {

  final String title;
  final String image;
  final String description;
  final String location;

  Details({Key key,this.location, @required this.title, @required this.image, this.description = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fancyAppBar(context,title,Icon(Icons.ac_unit)),
      body:
         Stack(
              children: <Widget>[
                imageContainer(image),

                LocationDescription(
                  title: title,
                  description: description,
                  location: location,
                  topMargin: 400.0,
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

class LocationDescription extends StatefulWidget {

  final title;
  final description;
  final location;
  final double topMargin;

  LocationDescription({Key key, @required this.title, this.description = '',this.location = '', this.topMargin = 400.0}) : super(key: key);

  @override
  _LocationDescriptionState createState() => _LocationDescriptionState();
}

class _LocationDescriptionState extends State<LocationDescription> {
  bool isClicked = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(10.0, widget.topMargin, 10.0, 0.0),
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0,0.3),
                  blurRadius: 10.0
                )
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.title, style: TextStyle(fontFamily: 'mainFont', fontSize: 26),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(widget.location, style: TextStyle(fontSize: 20.0),),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isClicked = (isClicked == true)? false: true;
                          });
                        },
                        icon: Icon((isClicked == true?Icons.favorite:Icons.favorite_border)),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isSaved = (isSaved == true)? false: true;
                          });
                        },
                        icon: Icon((isSaved == true?Icons.bookmark:Icons.bookmark_border)),
                      ),
                    ],
                  )

                ],
              ),
              Divider(thickness: 4,),
              SizedBox(height: 10.0,),
              Text("         ${widget.description}", style: TextStyle(fontSize: 20.0),textAlign: TextAlign.justify,)
            ],
          ),
        ),
      );
  }
}


Widget imageContainer(image) {
  return Container(
    height: 450.0,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/$image.jpg'),
            fit: BoxFit.cover
        )
    ),
  );
}

Widget showSnackBar(context,title) {
  return SnackBar(
    content: Text(title),
    elevation: 10.0,
  );
}

Widget fancyAppBar(context,title, action) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'mainFont',
          fontSize: 24
      ),
    ),
    leading: GestureDetector(onTap: (){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    actions: <Widget>[
      action
    ],
  );
}
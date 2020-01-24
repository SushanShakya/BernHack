import 'package:bern_hack_app/DemoData/database.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {

  final String title;
  final String image;
  final String description;
  final String location;

  Details({Key key,this.location, @required this.title, @required this.image, this.description = ''}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  DateTime _pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fancyAppBar(context,widget.title,Icon(Icons.ac_unit)),
      body:
         Stack(
              children: <Widget>[
                imageContainer(widget.image),

                LocationDescription(
                  title: widget.title,
                  image: widget.image,
                  pickedDate: (_pickedDate == null)? "Not Picked": "${_pickedDate.year}-${_pickedDate.month}-${_pickedDate.day}",
                  description: widget.description,
                  location: widget.location,
                  topMargin: MediaQuery.of(context).size.height - 250,
                )

              ],
            ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {
              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year + 5)
              ).then((date){
                setState(() {
                  _pickedDate = date;
                });
              });

            },
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
  final image;
  final pickedDate;
  final double topMargin;

  LocationDescription({Key key,this.pickedDate,this.image, @required this.title, this.description = '',this.location = '', this.topMargin = 400.0}) : super(key: key);

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
              Text(widget.title, style: TextStyle(fontFamily: 'mainFont', fontSize: 30),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(widget.location,),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isClicked = (isClicked == true)? false: true;
                          });
                          showSnackBar(context,"You Liked this");
                        },
                        icon: Icon((isClicked == true?Icons.favorite:Icons.favorite_border)),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isSaved = (isSaved == true)? false: true;
                          });
                          showSnackBar(context,"Added to Bookmarks");

                          BookMarkedData.insertBookmark({
                            'title' : widget.title,
                            'image' : widget.image,
                            'description' : widget.description,
                            'location' : widget.location,
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
              Text("         ${widget.description}", style: TextStyle(fontSize: 20.0),textAlign: TextAlign.justify,),
              SizedBox(height: 20.0,),
              Text("Picked Date : ${widget.pickedDate}", style: Theme.of(context).textTheme.title,)
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
          fontSize: 30
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
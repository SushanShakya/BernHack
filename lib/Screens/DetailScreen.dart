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
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: <Widget>[
          BackgroundSwiper(
            images: widget.image,
          ),
          DescriptionContainer(
            title: widget.title,
            location: widget.location,
            description: widget.description,
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

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'description.dart';

class ResortDescription extends StatefulWidget {

  final String title;
  final String description;
  final String location;
  final List<String> images;

  const ResortDescription({Key key,this.location, @required this.title, this.description, this.images}) : super(key: key);

  @override
  _ResortDescriptionState createState() => _ResortDescriptionState();
}

class _ResortDescriptionState extends State<ResortDescription> {

  int _currentIndex = 0;
  final SwiperController _swiperController = SwiperController();
  DateTime _pickedDate;

  @override
  Widget build(BuildContext context) {
    int count = (widget.images).length;
//    List myColors = [Colors.orange,Colors.blue];
    return Scaffold(
      appBar: fancyAppBar(context,"${widget.title}",Icon(Icons.ac_unit)),

      body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height/ 1.5,
              child: Swiper(
                itemCount: count,
                itemWidth: 300,
                autoplay: true,
                index: _currentIndex,
                controller: _swiperController,
                onIndexChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                loop: true,
                itemBuilder: (context,index) {
                  return imageContainer("${widget.images[index]}");
                },
              ),
            ),

            LocationDescription(
              title: "${widget.title}",
              description:"${widget.description}",
              image: widget.images[0],
              pickedDate: (_pickedDate == null)? "Not Picked": "${_pickedDate.year}-${_pickedDate.month}-${_pickedDate.day}",
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

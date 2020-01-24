import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BackgroundSwiper extends StatefulWidget {

  final int count;
  final String images;
  BackgroundSwiper({this.count = 2,@required this.images});

  @override
  _BackgroundSwiperState createState() => _BackgroundSwiperState();
}

class _BackgroundSwiperState extends State<BackgroundSwiper> {
  final SwiperController ctrl = new SwiperController();
  bool singleImage = true;

  @override
  void initState() {
//    if(widget.images.length > 1){
//      setState(() {
//        singleImage = false;
//      });
//    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Container(
      height: MediaQuery.of(context).size.height/ 1.5,
      child: Swiper(
        itemCount: widget.count,
        itemWidth: 300,
        autoplay: singleImage?false:true,
        index: _currentIndex,
        controller: ctrl,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        loop: singleImage?false:true,
        itemBuilder: (context,index) {
          return imageContainer("${widget.images}");
        },
      ),
    );

  }

  Widget imageContainer(String image) {
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      child: Image.asset('assets/images/$image.jpg', fit: BoxFit.cover,),
    );
  }
}

class DescriptionContainer extends StatelessWidget {

  final String title;
  final String location;
  final String description;

  const DescriptionContainer({Key key, this.title='Some Title', this.location = 'Location', this.description="Some Description"}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 150,
        padding: EdgeInsets.all(30.0),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: Theme.of(context).textTheme.title,textAlign: TextAlign.left,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(location),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                )
              ],
            ),
            Divider(
              thickness: 2.0,
            ),
            Text("        $description")
          ],
        ),
      ),
    );
  }
}


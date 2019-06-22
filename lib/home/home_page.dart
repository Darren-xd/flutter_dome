import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Home"),
          leading: new IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                      child: Text('冷'),
                      value: "hot",
                    ),
                    PopupMenuItem<String>(
                      child: Text('热'),
                      value: "low",
                    )
                  ],
              onSelected: (index) {},
              onCanceled: () {
                print("object");
              },
            )
          ],
        ),
        // body: Text('你好'),
        // body: new Swiper(
        //   itemBuilder: (BuildContext context, int index) {
        //     return new Image.network(
        //       "http://via.placeholder.com/350x150",
        //       fit: BoxFit.fill,
        //     );
        //   },
        //   itemCount: 5,
        //   scale: 0.8,
        //   viewportFraction: 0.8,
        //   pagination: new SwiperPagination(),
        //   control: new SwiperControl(),
        // ),
        body: Container(
          height: 150.0,
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                'http://via.placeholder.com/350x150',
                fit: BoxFit.fill,
              );
            },
            itemCount: 5,
            scale: 1.0,
            viewportFraction: 0.8,
            pagination: new SwiperPagination(),
            control: new SwiperControl(),
            autoplayDisableOnInteraction: true,
          ),
        ));
  }
}

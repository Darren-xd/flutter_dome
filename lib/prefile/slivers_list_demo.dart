import 'package:flutter/material.dart';

class SliversListDemo extends StatefulWidget {
  @override
  _SliversListDemoState createState() => _SliversListDemoState();
}

class _SliversListDemoState extends State<SliversListDemo> {
  String url =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561364499954&di=6cc1ff84f704aff53fcc4913ee4b2902&imgtype=0&src=http%3A%2F%2Fpic.eastlady.cn%2Fuploads%2Ftp%2F201708%2F9999%2F8aa8a85f3b.jpg";

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: Material(
              elevation: 13.0,
              shadowColor: Colors.red.withOpacity(.5),
              borderRadius: BorderRadius.circular(12.0),
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      url,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 35,
                    right: 35,
                    child: Text(
                      "Darren",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              )),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Settings"),
            bottom: TabBar(
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.yellow,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    '你好',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text(
                    '你好',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text(
                    '你好',
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SizedBox(
                height: 200,
                width: 100,
                child: Container(
                  color: Colors.green,
                  child: new Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        "http://via.placeholder.com/350x150",
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 5,
                    scale: 0.8,
                    viewportFraction: 0.8,
                    pagination: new SwiperPagination(),
                    control: new SwiperControl(),
                  ),
                ),
              ),

              Container(
                color: Colors.green,
                child: Icon(
                  Icons.add_to_home_screen,
                  size: 300,
                ),
              ),

              // Icon(
              //   Icons.access_alarm,
              //   size: 300,
              // ),

              DefaultTabController(
                length: 3,
                child: Scaffold(
                    appBar: TabBar(
                      unselectedLabelColor: Colors.black38,
                      labelColor: Colors.red,
                      indicatorColor: Colors.yellow,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 1.0,
                      tabs: <Widget>[
                        Tab(
                          icon: Icon(Icons.local_florist),
                          // text: '你好',
                        ),
                        Tab(
                          icon: Icon(Icons.change_history),
                        ),
                        Tab(
                          icon: Icon(Icons.directions),
                        )
                      ],
                    ),
                    body: TabBarView(
                      children: <Widget>[
                        Icon(
                          Icons.access_alarm,
                          size: 300,
                        ),
                        Icon(
                          Icons.change_history,
                          size: 300,
                        ),
                        Icon(
                          Icons.directions,
                          size: 300,
                        ),
                      ],
                    )),
              )
            ],
          )),
    );
  }
}

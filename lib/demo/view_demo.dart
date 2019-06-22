import 'package:flutter/material.dart';

class ViewDemo extends StatelessWidget {
  String url =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561205299484&di=28793bf2f1bb2bc50248d2b8efc6e1e9&imgtype=0&src=http%3A%2F%2Fs1.sinaimg.cn%2Fmw690%2F006fmRRJzy745Jb6KxG00%26690';

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 18.0,
          left: 18.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Darren",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("--作者"),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 10,
      itemBuilder: _pageItemBuilder,
    );
  }
}

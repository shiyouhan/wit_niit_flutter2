import 'package:flutter/material.dart';

class CardShareWx extends StatelessWidget {
  const CardShareWx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '将名片分享到微信',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Container());
  }
}

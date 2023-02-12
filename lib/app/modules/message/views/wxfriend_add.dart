import 'package:flutter/material.dart';

class WxFriendAdd extends StatelessWidget {
  const WxFriendAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '从微信好友中添加',
          style: TextStyle(fontSize: 18),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                // Get.to();
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/live_detail.dart';

class LiveCard extends StatelessWidget {
  String cover;
  String roomName;
  String? roomId;
  String? userId;

  LiveCard(
      {Key? key,
        required this.cover,
        required this.userId,
        required this.roomId,
        required this.roomName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        Get.to(LiveDetail(),arguments: [roomId,roomName]);
      },
      child: Card(
          elevation: 20.0,
          child: Column(children: <Widget>[
            Container(
              height: 120,
              child: Image.network(
                cover,
                fit: BoxFit.fill,
              ),
              margin: EdgeInsets.all(2),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581413287870&di=35491998b94817cbcf04d9f9f3d2d4b3&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D2464547320%2C3316604757%26fm%3D214%26gp%3D0.jpg"),
              ),
              title: Text(roomName),
              subtitle: Text(
                "直播内容介绍 ",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            )
          ])),
    );
  }
}
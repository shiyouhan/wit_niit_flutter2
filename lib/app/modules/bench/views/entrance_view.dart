import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/entrance_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/apply_into.dart';

import 'entrance_history.dart';

class EntranceView extends GetView<EntranceController> {
  const EntranceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('智慧入校'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: const BoxDecoration(
                // 线性渐变，分别设置渐变的颜色，起始点
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFF3083ED),
                      Color(0xFF3083ed),
                      Color(0xFF55CBF3)
                    ]),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "入校申请",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.holiday_village_outlined,
                    size: 85,
                    color: Colors.white38,
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(color: Colors.white,
                  // 阴影的颜色，模糊半径
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 6)]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Color(0xFFd2f1fe),
                            border: Border.all(color: Colors.blue)),
                        child: Text(
                          "进行中",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "学生",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "起止时间：2022-11-06-2023-01-31",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 160,
              width: 400,
              decoration: BoxDecoration(
                //圆角半径
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.white,
                  // 阴影的颜色，模糊半径
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "2022-11-14 星期一",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Stack(children: [
                          Icon(CupertinoIcons.star),
                          Positioned(
                              top: 5,
                              left: 3,
                              child: Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xFFfbdf84),
                              ))
                        ])
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("今日未申请，可查看历史记录"),
                    Divider(color: Colors.grey),
                    Row(
                      children: <Widget>[
                        Stack(children: [
                          Icon(CupertinoIcons.star),
                          Positioned(
                              top: 5,
                              left: 3,
                              child: Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xFFfbdf84),
                              ))
                        ]),
                        SizedBox(
                          width: 5,
                        ),
                        Text("助力疫情防控，静候春暖花开")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _botton(
                  title: '入校申请',
                  content: '提前申请入校', function: () {
                  Get.to(ApplyInto());
                },
                ),
                _botton(
                  title: '历史记录',
                  content: '查看历史记录', function: () {
                    Get.to(()=>EntranceHistory());
                },
                ),
              ],
            )
          ],
        ));
  }
}

class _botton extends StatelessWidget {
  String title;
  String content;
  Function() function;

  _botton({Key? key,
    required this.title,
    required this.content,
    required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      elevation: 10,
      padding: EdgeInsets.all(15),
      onPressed: function,
      child: Row(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.shade200),
            child: Icon(
              Icons.list_alt_rounded,
              size: 35,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                content,
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}

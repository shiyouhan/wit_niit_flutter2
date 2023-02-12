
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/component/image_show_server.dart';
import 'package:wit_niit_flutter2/app/modules/message/controllers/message_controller.dart';
import 'package:wit_niit_flutter2/app/modules/message/model/group_history_data.dart';
import 'package:wrapper/wrapper.dart';

import '../../mine/model/User.dart';
import '../controllers/chat_controller.dart';

/// 创建时间：2022/11/17
/// 作者：w2gd
/// 我的消息框
class MessageOwnTile extends StatelessWidget {
  const MessageOwnTile({
    Key? key,
    required this.messageDate,
    required this.widget,
  }) : super(key: key);
  final String messageDate;
  final Widget widget;

  static const _borderRadius = 25.0;

  @override
  Widget build(BuildContext context) {
    MessageController controller = Get.put(MessageController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(messageDate),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 300),
                    padding: EdgeInsets.only(right: 10),
                    child: Wrapper(
                      color: Colors.white,
                      spineType: SpineType.right,
                      spineHeight: 5,
                      angle: 90,
                      offset: 10,
                      child: widget,
                    ),
                  ),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    child:
                    // Obx(() {
                    //   return Container(
                    //     // child: controller.userList.map((element) => CircleAvatar(
                    //     //
                    //     // )),
                    //   child: Column(
                    //     children: controller.userList
                    //         .map((User user) => CircleAvatar(
                    //       backgroundImage: NetworkImage(user.photo),
                    //       radius: 30,
                    //     )).toList(),
                    //   )
                    //   );
                    // })
                    CircleAvatar(
                      backgroundImage: NetworkImage("https://vue-jingdong.oss-cn-beijing.aliyuncs.com/atavar3.png"),
                      radius: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///群聊消息框
class GroupMessageTitle extends StatelessWidget {
  const GroupMessageTitle({
    Key? key,
    required this.widget,
    required this.messageDate,
    required this.picture,
    required this.name
  }) : super(key: key);

  final Widget widget;
  final String messageDate;
  final String picture;
  final String name;

  @override
  Widget build(BuildContext context) {
    MessageController controller = Get.put(MessageController());
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(messageDate),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(picture),
                          radius: 30,
                        ),
                      ),
                      Column(

                        children: [
                          Container(
                              child: Text(name,style: TextStyle(color: Colors.grey),),
                            margin: EdgeInsets.only(right: 20),
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 300),
                            padding: EdgeInsets.only(left: 10),
                            child: Wrapper(
                              color: Colors.white,
                              spineType: SpineType.left,
                              spineHeight: 5,
                              angle: 90,
                              offset: 10,
                              child: widget,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
          ]
        ),
      ),
    );
  }
}


/// 对方的消息框
class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.widget,
    required this.messageDate,

  }) : super(key: key);

  final Widget widget;
  final String messageDate;



  @override
  Widget build(BuildContext context) {
    MessageController controller = Get.put(MessageController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Center(
               child: Text(messageDate),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(controller.avatar.value),
                      radius: 30,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 300),
                    padding: EdgeInsets.only(left: 10),
                    child: Wrapper(
                      color: Colors.white,
                      spineType: SpineType.left,
                      spineHeight: 5,
                      angle: 90,
                      offset: 10,
                      child: widget,
                    ),
                  )
                ],
              ),
            ),
            // Row(
            //   children: [
            //     Container(
            //       padding: EdgeInsets.all(5.0),
            //       child: CircleAvatar(
            //         backgroundImage: NetworkImage(controller.avatar.value),
            //         radius: 30,
            //       ),
            //     ),
            //     Container(
            //       decoration: BoxDecoration(
            //         color: Colors.lightBlueAccent,
            //         borderRadius: const BorderRadius.only(
            //           topLeft: Radius.circular(_borderRadius),
            //           topRight: Radius.circular(_borderRadius),
            //           bottomRight: Radius.circular(_borderRadius),
            //         ),
            //       ),
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            //             child: widget,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 8.0),
            //   child: Text(
            //     messageDate,
            //     style: TextStyle(
            //       fontSize: 10.sp,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}

/// 文本消息
class TextMsg extends StatelessWidget {
  final String message;
  const TextMsg({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(color: Colors.black, fontSize: 16.sp),
    );
  }
}



/// 远程图片消息
class ImgMsg extends StatelessWidget {
  final String? imgUrl;
  const ImgMsg({Key? key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      child: GestureDetector(
        onTap: () {
          // 查看大图
          List _showList = [imgUrl];
          Get.to(
                () => ImageShowServer(
              type: 1,
              photoList: _showList,
            ),
          );
        },
        child: Image.network(imgUrl!),
      ),
    );
  }
}

/// 本地图片消息
class ImgFileMsg extends StatelessWidget {
  final String filepath;
  const ImgFileMsg({Key? key, required this.filepath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      child: GestureDetector(
        onTap: () {
          // 查看大图
          List _showList = [filepath];
          Get.to(
                () => ImageShowServer(photoList: _showList),
          );
        },
        child: Image.file(File(filepath)),
      ),
    );
  }
}
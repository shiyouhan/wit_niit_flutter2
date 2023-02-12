import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/component/Iconfont.dart';
import 'package:wit_niit_flutter2/app/data/base_data.dart';
import 'package:wit_niit_flutter2/app/modules/message/controllers/chat_controller.dart';

import '../../../data/theme_data.dart';
import '../model/chat_avatar_data.dart';
import '../model/chat_content_data.dart';
import 'component/dashline.dart';

class ChatMessageView extends GetView<ChatController> {
  const ChatMessageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.put(ChatController());
    return Scaffold(
      backgroundColor: BaseData.bodyColor,
      appBar: AppBar(
        title: const Text('聊天信息'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10,left: 10,right: 10),
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 300.h,
                padding: EdgeInsets.only(top: 10,left: 10),
                child: GridView.count(
                  crossAxisCount: 5,
                  childAspectRatio: 3/4,
                  children: controller.chatAvatarList.map((Chat chat)  {
                    return Container(
                      padding: EdgeInsets.only(right: 10),
                      height: 50,
                      child: Column(
                        children: [
                          chat.image!=""?
                          Image(
                            image: NetworkImage(chat.image),
                          ):DottedBorder(
                            padding: EdgeInsets.all(5.0),
                            color: Colors.grey,
                            strokeWidth: 0.5,
                            child: Icon(
                                Icons.add,
                                size: 50,
                                color: Colors.grey
                            ),
                          ),
                          chat.nickname != ""?
                          Text(chat.nickname,style: TextStyle(color: Colors.grey)):Container()
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 10,bottom: 10),
                child: Column(
                  children: [
                    Divider(),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("查看全部群成员"),
                          SizedBox(width: 170.w,),
                          Text("252人",style: TextStyle(color: Colors.grey),),
                          IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_outlined),color: Colors.grey,)
                        ],
                      ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("群聊名称"),
                        SizedBox(width: 50.w,),
                        Text("计算机学院2023届本科毕业生",style: TextStyle(color: Colors.grey),),
                        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_outlined),color: Colors.grey,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("群二维码名片"),
                        SizedBox(width: 180.w,),
                        IconButton(onPressed: () {}, icon: Icon(cIcons.icon_erweima),color: Colors.grey,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_outlined),color: Colors.grey,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("群公告"),
                        SizedBox(width: 180.w,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_outlined),color: Colors.grey,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("备注"),
                        SizedBox(width: 180.w,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_outlined),color: Colors.grey,)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("查找聊天记录"),
                        SizedBox(width: 180.w,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_outlined),color: Colors.grey,)
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: controller.chatContentList.map((Content content) {
                            return Container(
                              padding: EdgeInsets.only(right: 10,bottom: 10),
                              child: Column(
                                children: [
                                  IconButton(onPressed: () {}, icon: Icon(content.icon),color: Colors.grey,iconSize: 20,),
                                  Text(content.content)
                                ],
                              ),
                            );
                          }).toList()
                            // IconButton(onPressed: () {}, icon: ,color: Colors.grey,iconSize: 20,),
                            // Text("文件")
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("消息免打扰"),
                        SizedBox(width: 180.w,),
                        CupertinoSwitch(
                            activeColor: Config.primaryColor,
                            trackColor: Config.primarySwatchColor.shade50,
                            value: controller.flag1.value, onChanged: (value) {
                          // controller.flag = true;
                          controller.msgSwitch();
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("置顶聊天"),
                        SizedBox(width: 180.w,),
                        CupertinoSwitch(
                            activeColor: Config.primaryColor,
                            trackColor: Config.primarySwatchColor.shade50,
                            value: controller.flag2.value, onChanged: (value) {
                          // controller.flag = true;
                          controller.chatSwitch();
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("保存到通讯录"),
                        SizedBox(width: 180.w,),
                        CupertinoSwitch(
                            activeColor: Config.primaryColor,
                            trackColor: Config.primarySwatchColor.shade50,
                            value: controller.flag3.value,
                            onChanged: (value) {
                          // controller.flag = true;
                          controller.contactSwitch();
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("查看群成员日程"),
                        SizedBox(width: 180.w,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_outlined),color: Colors.grey,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("邀请群成员语音通话"),
                        SizedBox(width: 180.w,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_outlined),color: Colors.grey,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("给群成员发邮件"),
                        SizedBox(width: 180.w,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_outlined),color: Colors.grey,)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("设置当前聊天背景"),
                        SizedBox(width: 180.w,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_outlined),color: Colors.grey,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("投诉"),
                        SizedBox(width: 180.w,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_outlined),color: Colors.grey,)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10.0),
                width: 400.w,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("清空聊天记录",style: TextStyle(color: Colors.red,fontSize: 15),),
                    Divider(),
                    Text("退出群聊",style: TextStyle(color: Colors.red,fontSize: 15),),
                  ],
                ),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}

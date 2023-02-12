import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:wit_niit_flutter2/app/component/Iconfont.dart';
import 'package:wit_niit_flutter2/app/data/base_data.dart';
import 'package:wit_niit_flutter2/app/modules/message/controllers/message_controller.dart';
import 'package:wit_niit_flutter2/app/modules/message/model/contact_model.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/link/link_caldener.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/link/link_computer.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/link/meeting_view.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/meaage_detail.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/meaasge_search.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/faqiqunliao_view.dart';

import '../../mine/views/mine_view.dart';
import '../widget/avatar.dart';
import 'component/scan_view.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MessageController controller = Get.put(MessageController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //背景色
      backgroundColor: BaseData.bodyColor,
      /*设置左侧侧边栏*/
      drawer: Drawer(
        width: size.width * 0.88,
        child: MineView(),
      ),
      appBar: AppBar(
        title: const Text('消息'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(cIcons.icon_liebiaoxuanze),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        //右侧行为按钮
        actions: [
          IconButton(
              onPressed: () => Get.to(MessageSearch()),
              icon: Icon(Icons.search)),
          const Button()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(LinkComputer());
                        },
                        icon: new Icon(cIcons.icon_computer,
                            color: Color(0xFF929294)),
                      ),
                      Text(
                        "连接电脑",
                        style: TextStyle(color: Color(0xFF929294)),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(LinkCalendar());
                          },
                          icon: new Icon(
                            cIcons.icon_richeng,
                            color: Color(0xFF929294),
                            size: 20,
                          )),
                      Text(
                        "日程",
                        style: TextStyle(color: Color(0xFF929294)),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(MeetingView());
                          },
                          icon: new Icon(
                            cIcons.icon_huiyi,
                            color: Color(0xFF929294),
                            size: 25,
                          )),
                      Text(
                        "会议",
                        style: TextStyle(color: Color(0xFF929294)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(),
            Container(
              // child: InkWell(
              //   onTap: () {
              //     Get.to(MessageDetail(),arguments: contact.nickname);
              //   },

              child: Obx(() {
                return ListView(
                  shrinkWrap: true,
                  children: controller.contactList
                      .map((ContactModel contact) => SizedBox(
                            height: 80,
                            child: InkWell(
                              onTap: () {
                                Get.to(MessageDetail(),
                                    arguments: contact.nickname);
                                controller.friendId.value = contact.itemId;
                                controller.avatar.value = contact.avatar;
                              },
                              child: ListTile(
                                title: Text(contact.nickname),
                                subtitle: Text(
                                  contact.lastMsg,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading:
                                    Avatar(url: contact.avatar, radius: 30),
                                trailing: Text(contact.lastTime
                                    .toString()
                                    .substring(
                                        0,
                                        contact.lastTime.toString().length -
                                            9)),
                              ),
                            ),
                          ))
                      .toList(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: new Icon(cIcons.icon_jiahao),
        onPressed: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const ListItems(),
            // onPop: () => print('Popover was popped!'),
            // direction: PopoverDirection.bottom,
            width: 150.w,
            height: 150.h,
            // arrowDxOffset: -10
            arrowDyOffset: 10,
            arrowHeight: 5,
            arrowWidth: 15,
          );
        },
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        margin: const EdgeInsets.only(left: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(children: [
                  Icon(
                    cIcons.icon_message1,
                    color: Color(0xFF364fc7),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    '发起群聊',
                    style: TextStyle(color: Color(0xFF364fc7)),
                  ),
                ]),
              ),
              const Divider(),
              InkWell(
                onTap: () => Get.to(groupChat()),
                child: Container(
                  child: Row(children: [
                    Icon(cIcons.icon_weixin, color: Color(0xFF364fc7)),
                    SizedBox(width: 20.w),
                    Text(
                      '加微信',
                      style: TextStyle(color: Color(0xFF364fc7)),
                    ),
                  ]),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Get.to(openScan());
                },
                child: Container(
                  child: Row(children: [
                    Icon(cIcons.icon_saoyisao, color: Color(0xFF364fc7)),
                    SizedBox(width: 20.w),
                    Text(
                      '扫一扫',
                      style: TextStyle(color: Color(0xFF364fc7)),
                    ),
                  ]),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                      title: "",
                      titleStyle: TextStyle(fontSize: 0),
                      radius: 5.0,
                      content: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            // padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  cIcons.icon_rest,
                                  color: Color(0xFF364fc7),
                                  size: 40,
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  children: [
                                    Container(
                                        margin:
                                            const EdgeInsets.only(right: 120),
                                        child: Text(
                                          "小休",
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xFF364fc7)),
                                        )),
                                    Text(
                                      "1小时内不接收消息通知",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            // padding: const EdgeInsets.only(bottom: 20),
                            margin: const EdgeInsets.only(left: 20),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.work,
                                  color: Color(0xFF364fc7),
                                  size: 40,
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  children: [
                                    Container(
                                        margin:
                                            const EdgeInsets.only(right: 150),
                                        child: Text(
                                          "下班了",
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xFF364fc7)),
                                        )),
                                    Text(
                                      "明天09：00前不接收消息通知",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ));
                },
                child: Container(
                  // width: 30.w,
                  // height: 30.h,
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(cIcons.icon_rest, color: Color(0xFF364fc7)),
                        SizedBox(width: 20.w),
                        Text(
                          '休息一下',
                          style: TextStyle(color: Color(0xFF364fc7)),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  String title;
  String subtitle;
  Image image;
  final DateTime messageTime;

  Message(this.title, this.subtitle, this.image, this.messageTime);
}

List<Message> messageList = [
  Message('一周小结', '查收你的企业微信一周小结', Image.asset("assets/images/notice.png"),
      DateTime(2022, 11, 14)),
  Message(
      '通知公告',
      '各位同学大家好，我校2023届毕业生秋季...',
      Image.asset(
        "assets/images/gonggao.png",
      ),
      DateTime(2022, 11, 14)),
  Message('丁旭东', '聊天记录', Image.asset("assets/images/avatar1.png"),
      DateTime(2022, 11, 14)),
  Message('消息中心', '学生请假通过', Image.asset("assets/images/xiaoxi.png"),
      DateTime(2022, 11, 14)),
  Message('群聊', '你退出了群聊', Image.asset("assets/images/qunliao.png"),
      DateTime(2022, 11, 14)),
  Message('群聊', '你退出了群聊', Image.asset("assets/images/qunliao.png"),
      DateTime(2022, 11, 14)),
  Message('群聊', '你退出了群聊', Image.asset("assets/images/qunliao.png"),
      DateTime(2022, 11, 14)),
  Message('群聊', '你退出了群聊', Image.asset("assets/images/qunliao.png"),
      DateTime(2022, 11, 14)),
  Message('群聊', '你退出了群聊', Image.asset("assets/images/qunliao.png"),
      DateTime(2022, 11, 14)),
  Message('群聊', '你退出了群聊', Image.asset("assets/images/qunliao.png"),
      DateTime(2022, 11, 14))
];

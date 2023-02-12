
import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:wit_niit_flutter2/app/component/Iconfont.dart';
import 'package:wit_niit_flutter2/app/modules/message/model/group_history_data.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/faqiqunliao_view.dart';

import '../../../../main.dart';
import '../../../config/net_url.dart';
import '../model/chat_avatar_data.dart';
import '../model/chat_content_data.dart';
import '../model/chat_record.dart';
import '../widget/message_title.dart';
import 'message_controller.dart';

class ChatController extends GetxController {

  List<Chat> chatAvatarList = [
    Chat("https://vue-jingdong.oss-cn-beijing.aliyuncs.com/avatar/2.jpg","丁旭东"),
    Chat('https://vue-jingdong.oss-cn-beijing.aliyuncs.com/atavar3.png',"刘亦菲"),
    Chat('https://vue-jingdong.oss-cn-beijing.aliyuncs.com/avatar/1.jpg',"杨洋"),
    Chat('https://vue-jingdong.oss-cn-beijing.aliyuncs.com/avatar/0.png',"吴彦祖"),
    Chat('https://vue-jingdong.oss-cn-beijing.aliyuncs.com/avatar/atavar6.jpg',"容祖儿"),
    Chat("https://vue-jingdong.oss-cn-beijing.aliyuncs.com/avatar/2.jpg","丁旭东"),
    Chat('https://vue-jingdong.oss-cn-beijing.aliyuncs.com/atavar3.png',"刘亦菲"),
    Chat('https://vue-jingdong.oss-cn-beijing.aliyuncs.com/avatar/1.jpg',"杨洋"),
    Chat('https://vue-jingdong.oss-cn-beijing.aliyuncs.com/avatar/0.png',"吴彦祖"),
    Chat('https://vue-jingdong.oss-cn-beijing.aliyuncs.com/avatar/atavar6.jpg',"容祖儿"),
    Chat("https://vue-jingdong.oss-cn-beijing.aliyuncs.com/avatar/2.jpg","宋小宝"),
    Chat('https://vue-jingdong.oss-cn-beijing.aliyuncs.com/atavar3.png',"贾玲"),
    Chat('https://vue-jingdong.oss-cn-beijing.aliyuncs.com/avatar/1.jpg',"张三"),
    Chat('https://vue-jingdong.oss-cn-beijing.aliyuncs.com/avatar/atavar6.jpg',"李四"),
  ];

//判断按钮状态
  var flag3 = false.obs;
  var flag2 = false.obs;
  var flag1 = false.obs;
  // 判断输入框是否有内容
  var hasContent = false.obs;
  // 是否隐藏底部菜单
  var hiddenMenu = true.obs;
  // 是否隐藏 emoji 选择器
  var hiddenEmoji = true.obs;
  // 输入框控制器
  TextEditingController msgText = TextEditingController();
  // 滚动控制器
  ScrollController scroll = ScrollController();
  // 消息列表
  var msgList = <Widget>[].obs;
  void scrollToBottom() {
    Future.delayed(Duration(milliseconds: 300), () {
      scroll.animateTo(scroll.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });

  }
  List<Content> chatContentList = [
    Content(cIcons.icon_file, "文件"),
    Content(cIcons.icon_picture, "图片/视频"),
    Content(cIcons.icon_lianjie, "链接"),
    Content(cIcons.icon_qungju, "群工具"),
    Content(cIcons.icon_xiaocx, "小程序"),
  ];

  // void setId(String id) {
  //   itemId.value = id;
  // }
   void msgSwitch() {
    if (flag1.value) {
      flag1.value = !flag1.value;
    } else {
      flag1.value = !flag1.value;
    }
  }
  void chatSwitch() {
    if (flag2.value) {
      flag2.value = !flag2.value;
    } else {
      flag2.value = !flag2.value;
    }
  }
  void contactSwitch() {
    if (flag3.value) {
      flag3.value = !flag3.value;
    } else {
      flag3.value = !flag3.value;
    }
  }

  void addMore() {
    chatAvatarList.add(
      Chat('',""),
    );
  }
  @override
  void onInit() {
    super.onInit();
    getSingleHistory(Get.find<MessageController>().friendId);
    groupHistory(Get.find<MessageController>().friendId);
    // getSingleHistory("String");
    addMore();
    // 获取聊天记录
  }

  @override
  void onReady() {
    super.onReady();
    scroll.jumpTo(scroll.position.maxScrollExtent); // 滚动到底部
  }

  @override
  void onClose() {
    super.onClose();
  }

  //TODO: 发送文字消息
  void sendMsg(id) async {
    LogUtil.v('联系人id: $id');
    if (msgText.text.length != 0) {
      LogUtil.v('发送消息～～');
      var dataForm = {
        "msg": msgText.text,
        "userId": Get.find<MessageController>().friendId.value,
        "type":1,
        "fromId": SpUtil.getString('id'),
        // "fromId":'String'
      };
       request.post('${NetUrl.kUrl_message}/sendsingle', data: dataForm).then((value) {
        LogUtil.v('发送消息返回 $value');
      });

      final dateTime = DateTime.now();
      msgList.add(
        MessageOwnTile(
          messageDate: "${dateTime.month.toString()}月${dateTime.day.toString()}日 ${dateTime.hour.toString()}:${dateTime.minute.toString()}",
          widget: TextMsg(message: msgText.text),
        ),
      );

      // 滚动到底部、输入清空
      scrollToBottom();
      msgText.text = '';
      hasContent.value = false;
    }
  }
  //TODO 发送图片消息
  void sendImageMsg() async {
    EasyLoading.showToast('选择图片');
    List<Media>? res = await ImagesPicker.pick(count: 1, pickType: PickType.image);
    if (res != null) {
      var path = res[0].path; // 本地图片地址
      LogUtil.v(path);
      var dateTime = new DateTime.now();
      msgList.add(
        MessageOwnTile(
          messageDate: "${dateTime.month.toString()}月${dateTime.day.toString()}日 ${dateTime.hour.toString()}:${dateTime.minute.toString()}",
          widget: ImgFileMsg(filepath: path),
        ),
      );
    }
    scrollToBottom();
  }
  /// 获取私聊记录： 1是私聊，2是群聊
  /// type: 1是文字，2是文件
  void getSingleHistory(toId) async {
    String? myId = SpUtil.getString('id');
    // String? myId = '777';
    List chatList = await request.get('${NetUrl.kUrl_message}/singlehistory/$myId&$toId');
    // 聊天记录渲染

    chatList.forEach((e) {
      PrivateChatRecord record = PrivateChatRecord.fromJson(e);
      print(record.content);
      // 我发送给对方的消息
      if (myId == record.fromId) {
        // 文字消息
        if (record.type == 1) {
          msgList.add(
            MessageOwnTile(
              messageDate: record.createTime,
              widget: TextMsg(message: record.content),
            ),
          );
        }
      } else if (toId == record.fromId) {
        if (record.type == 1) {
          msgList.add(
            MessageTile(
              messageDate: record.createTime,
              widget: TextMsg(message: record.content),
            ),
          );
        }
      }
    });
  }

  void groupHistory(groupId) async {
    var groupList = <Data>[].obs;
 // var groupChatList = Get.find<MessageController>().groupList;
    String? myId = SpUtil.getString('id');
    List chatList = await request.get('${NetUrl.kUrl_message}/grouphistory/$groupId');
    // 聊天记录渲染

    chatList.forEach((e) {
      Data data = Data.fromJson(e);
      // Map<String, dynamic> record =  jsonDecode(response.data);
    print(data.content);
      // 我发送给对方的消息
      if (groupId == data.groupId) {
        // 文字消息
        if (data.type == 1) {
          msgList.add(
            // MessageOwnTile(
            //   messageDate: data.createTime,
            //   widget: TextMsg(message: data.content),
            // ),
              GroupMessageTitle(
                messageDate: data.createTime,
                  widget: TextMsg(message: data.content),
                picture: data.pic,
                name: data.name,
              )

          );

        }
      } else if (myId == data.fromId) {
        if (data.type == 1) {
          msgList.add(
            MessageOwnTile(
              messageDate: data.createTime,
              widget: TextMsg(message: data.content),
            ),
          );
        }
      }
    }
    );
  }

}

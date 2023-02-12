import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/component/Iconfont.dart';
import 'package:wit_niit_flutter2/app/modules/message/controllers/message_detail_controller.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/chat_message_view.dart';
import '../../../data/base_data.dart';
import '../controllers/chat_controller.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart' as emoji;

import '../controllers/message_controller.dart';
import '../model/chat_item.dart';
import '../widget/glowing_action_button.dart';

class MessageDetail extends GetView<ChatController> {
  const MessageDetail({Key? key}) : super(key: key);

  // final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    MessageController messageController = Get.put(MessageController());
    ChatController controller = Get.put(ChatController());
    MessageDetailController messageDetailController =  Get.put(MessageDetailController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BaseData.bodyColor,
      appBar: AppBar(
        title: Text(messageDetailController.name.value),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(cIcons.icon_vedio)
          ),
          IconButton(
              onPressed: () => Get.to(ChatMessageView()),
              icon: Icon(cIcons.icon_more)
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _MessageList()),
          _ActionBar(messageController.friendId.value),//接收者id
        ],
      ),
    );
  }
}

class _MessageList extends GetView<ChatController> {
  const _MessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode()); // 关闭键盘
        controller.hiddenMenu.value = true; // 隐藏菜单
        controller.hiddenEmoji.value = true; // 隐藏 emoji
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(() {
          return ListView(
            controller: controller.scroll,
            children: controller.msgList,
          );
        }),
      ),
    );
  }
}

class _ActionBar extends GetView<ChatController> {
  final String contactId;

  const _ActionBar(this.contactId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 2,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(cIcons.icon_voice),
                    )
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: TextField(
                    minLines: 1,
                    maxLines: 4,
                    controller: controller.msgText,
                    onChanged: (v) {
                      if (v.length > 0) {
                        controller.hasContent.value = true;
                      } else {
                        controller.hasContent.value = false;
                      }
                    },
                    onTap: () {
                      controller.hiddenMenu.value = true; // 隐藏菜单
                      controller.hiddenEmoji.value = true; // 隐藏emoji
                      controller.scrollToBottom(); // 滚动到底部
                    },
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: '发送',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode()); // 关闭键盘
                    controller.hiddenEmoji.value = false; // 显示emoji
                    controller.hiddenMenu.value = true; // 隐藏菜单
                    controller.scrollToBottom();
                  },
                  child: Icon(cIcons.icon_biaoqing),
                ),
              ),
              Container(
                width: 60.w,
                padding: const EdgeInsets.only(left: 6, right: 14.0),
                child: Obx(() {
                  return controller.hasContent.value
                      ? GlowingActionButton(
                    color: Colors.lightBlueAccent,
                    icon: Icons.send_rounded,
                    size: 40.w,
                    onPressed: () {
                      controller.sendMsg(contactId);
                    },
                  )
                      : IconButton(
                    onPressed: () {
                      controller.hiddenMenu.value = false; // 显示菜单
                      controller.hiddenEmoji.value = true; // 隐藏emoji
                      FocusScope.of(context).requestFocus(FocusNode()); //收起键盘
                      controller.scrollToBottom(); // 滚动到底部
                    },
                    icon: Icon(cIcons.icon_jiahao),
                  );
                }),
              ),
            ],
          ),
          Obx(() {
            return Offstage(offstage: controller.hiddenMenu.value, child: _menu());
          }),
          Obx(() {
            return Offstage(offstage: controller.hiddenEmoji.value, child: _emojiMenu());
          }),
        ],
      ),
    );
  }
  Widget _menu() {
    /// 聊天底部菜单列表
    final List ChatMenuList = [
      ChatItem(
        title: '图片',
        imgUrl: 'assets/images/tup.png',
        onTap: () {
          controller.sendImageMsg();
        },
      ),
      ChatItem(
        title: '拍摄',
        imgUrl: 'assets/images/ps.png',
        onTap: () {
          EasyLoading.showToast('拍摄视频');
        },
      ),
      ChatItem(
        title: '收藏',
        imgUrl: 'assets/images/sc.png',
        onTap: () {
          EasyLoading.showToast('分享收藏');
        },
      ),
      ChatItem(
        title: '文件',
        imgUrl: 'assets/images/wj.png',
        onTap: () {
          EasyLoading.showToast('分享文件');
        },
      ),
      ChatItem(
        title: '图文消息',
        imgUrl: 'assets/images/tuwen.png',
        onTap: () {
          EasyLoading.showToast('输入图文消息');
        },
      ),
      ChatItem(
        title: '日程',
        imgUrl: 'assets/images/rc.png',
        onTap: () {
          EasyLoading.showToast('发送日程');
        },
      ),
    ];
    return Container(
      height: 200.h,
      color: Color(0xfff3f3f3),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GridView.builder(
        itemCount: ChatMenuList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          ChatItem item = ChatMenuList[index];
          return GestureDetector(
            onTap: item.onTap,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: Image.asset(item.imgUrl),
                  ),
                ),
                Text(item.title),
              ],
            ),
          );
        },
      ),
    );
  }

  /// emoji
  Widget _emojiMenu() {
    return SizedBox(
      height: 250,
      child: emoji.EmojiPicker(
        onEmojiSelected: (emoji.Category? category, emoji.Emoji? emoji) {
          controller.hasContent.value = true;
        },
        onBackspacePressed: () {
          controller.msgText.text.length - 1;
        },
        textEditingController: controller.msgText,
        config: emoji.Config(
          columns: 7,
          emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
          verticalSpacing: 0,
          horizontalSpacing: 0,
          gridPadding: EdgeInsets.zero,
          initCategory: emoji.Category.RECENT,
          bgColor: const Color(0xFFF2F2F2),
          indicatorColor: Colors.blue,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          backspaceColor: Colors.blue,
          skinToneDialogBgColor: Colors.white,
          skinToneIndicatorColor: Colors.grey,
          enableSkinTones: true,
          showRecentsTab: true,
          recentsLimit: 28,
          replaceEmojiOnLimitExceed: false,
          noRecents: const Text(
            'No Recents',
            style: TextStyle(fontSize: 20, color: Colors.black26),
            textAlign: TextAlign.center,
          ),
          loadingIndicator: const SizedBox.shrink(),
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: const emoji.CategoryIcons(),
          buttonMode: emoji.ButtonMode.MATERIAL,
          checkPlatformCompatibility: true,
        ),
      ),
    );
  }
}






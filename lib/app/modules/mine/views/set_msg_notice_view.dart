// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/data/theme_data.dart';

import '../controllers/set_msg_notice_controller.dart';

class SetMsgNoticeView extends GetView<SetMsgNoticeController> {
  const SetMsgNoticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SetMsgNoticeController controller = Get.put(SetMsgNoticeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '新消息通知',
          style: BaseStyle.fs16,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      '新消息通知',
                      style: BaseStyle.fs16,
                    ),
                    trailing: CupertinoSwitch(
                      activeColor: Config.primaryColor,
                      trackColor: Config.primarySwatchColor.shade50,
                      value: controller.flag1.value,
                      onChanged: (value) {
                        controller.msgSwitch();
                      },
                    ),
                  ),
                  Container(
                    height: 1.h,
                    color: Config.primarySwatchColor.shade50,
                    margin: EdgeInsets.only(left: 16.0),
                  ),
                  ListTile(
                    title: Text(
                      '语音和视频通话提醒',
                      style: BaseStyle.fs16,
                    ),
                    trailing: CupertinoSwitch(
                      activeColor: Config.primaryColor,
                      trackColor: Config.primarySwatchColor.shade50,
                      value: controller.flag2.value,
                      onChanged: (value) {
                        controller.vvSwitch();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 62.h,
            padding: EdgeInsets.only(
              top: 10.0,
              left: 12.0,
              right: 12.0,
            ),
            child: Text(
              '更改通知样式，请在手机的"设置"-"通知"功能中，找到应用程序"智慧南工"更改。',
              style: BaseStyle.fs12G,
            ),
          ),
          Obx(
            () => Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      '声音',
                      style: BaseStyle.fs16,
                    ),
                    trailing: CupertinoSwitch(
                      activeColor: Config.primaryColor,
                      trackColor: Config.primarySwatchColor.shade50,
                      value: controller.flag3.value,
                      onChanged: (value) {
                        controller.soundSwitch();
                      },
                    ),
                  ),
                  Container(
                    height: 1.h,
                    color: Config.primarySwatchColor.shade50,
                    margin: EdgeInsets.only(left: 16.0),
                  ),
                  ListTile(
                    title: Text(
                      '通知显示消息详情',
                      style: BaseStyle.fs16,
                    ),
                    trailing: CupertinoSwitch(
                      activeColor: Config.primaryColor,
                      trackColor: Config.primarySwatchColor.shade50,
                      value: controller.flag4.value,
                      onChanged: (value) {
                        controller.newsSwitch();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 62.h,
            padding: EdgeInsets.only(
              top: 10.0,
              left: 12.0,
              right: 12.0,
            ),
            child: Text(
              '关闭后，当收到智慧南工消息时，通知提示将不显示发信人和内容摘要。',
              style: BaseStyle.fs12G,
            ),
          ),
          Obx(
            () => Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      '仅在智慧南工中接收消息',
                      style: BaseStyle.fs16,
                    ),
                    trailing: CupertinoSwitch(
                      activeColor: Config.primaryColor,
                      trackColor: Config.primarySwatchColor.shade50,
                      value: controller.flag5.value,
                      onChanged: (value) {
                        controller.receiveSwitch();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 12.0,
              right: 12.0,
            ),
            child: Text(
              '开启后，微信将不再接收消息',
              style: BaseStyle.fs12G,
            ),
          ),
        ],
      ),
    );
  }
}

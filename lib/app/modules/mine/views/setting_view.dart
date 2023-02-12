// ignore_for_file: prefer_const_constructors

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/login/views/login_view.dart';
import 'package:wit_niit_flutter2/app/modules/login/views/start_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/set_about_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/set_account_security_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/set_currency_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/set_msg_notice_view.dart';

import '../../../data/base_style.dart';
import '../../../data/theme_data.dart';

class SettingView extends GetView {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () => Get.to(SetAccountSecurityView()),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    "账号与安全",
                    style: BaseStyle.fs16,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_outlined,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () => Get.to(SetMsgNoticeView()),
                    title: Text(
                      "新消息通知",
                      style: BaseStyle.fs16,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Container(
                    height: 1.h,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: Config.primarySwatchColor.shade50,
                  ),
                  ListTile(
                    onTap: () => Get.to(SetCurrencyView()),
                    title: Text(
                      "通用",
                      style: BaseStyle.fs16,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ],
              ),
            ),
            Container(
              height: 34.h,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                "隐私",
                style: BaseStyle.fs12G,
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      "联系人权限",
                      style: BaseStyle.fs16,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Container(
                    height: 1.h,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: Config.primarySwatchColor.shade50,
                  ),
                  ListTile(
                    title: Text(
                      "个人信息与权限",
                      style: BaseStyle.fs16,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Container(
                    height: 1.h,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: Config.primarySwatchColor.shade50,
                  ),
                  ListTile(
                    title: Text(
                      "第三方共享清单",
                      style: BaseStyle.fs16,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      "吐个槽",
                      style: BaseStyle.fs16,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Container(
                    height: 1.h,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: Config.primarySwatchColor.shade50,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(SetAboutView()),
                    child: ListTile(
                      title: Text(
                        "关于智慧南工",
                        style: BaseStyle.fs16,
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              height: 54.h,
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "我的企业",
                  style: BaseStyle.fs16,
                ),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 54.h,
              child: RawMaterialButton(
                onPressed: () => showDialog(
                  context: context,
                  barrierDismissible: false, // 点击外部不消失
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text('退出登录？'),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text('取消'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoDialogAction(
                          child: const Text('确定'),
                          onPressed: () {
                            SpUtil.remove("token");
                            SpUtil.remove("id");
                            Get.to(StartView());
                          },
                        ),
                      ],
                    );
                  },
                ),
                child: Text(
                  "退出登录",
                  style: BaseStyle.fs16W.copyWith(color: Colors.red),
                ),
              ),
            ),
            // SizedBox(height: 140.h),
          ],
        ),
      ),
    );
  }
}

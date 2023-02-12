// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/info_password_controller.dart';

import '../../../data/base_style.dart';
import '../../../data/theme_data.dart';

class InfoPasswordView extends GetView {
  const InfoPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    InfoPasswordController controller = Get.put(InfoPasswordController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '重置密码',
          style: BaseStyle.fs16W.copyWith(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Config.primarySwatchColor.shade50,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          GestureDetector(
            onTap: () => controller.changePwd(),
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 18.0),
              child: Text(
                '确定',
                style: BaseStyle.fs16.copyWith(color: Colors.grey),
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        width: size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
              child: Text(
                '旧密码',
                style: BaseStyle.fs14G,
              ),
            ),
            Obx(
              () => TextFormField(
                decoration: InputDecoration(
                    // hintText: "123123",
                    ),
                controller: controller.oldPassController.value,
                onChanged: (value) {
                  controller.oldPassNumber(value);
                  print(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
              child: Text(
                '新密码',
                style: BaseStyle.fs14G,
              ),
            ),
            Obx(
              () => TextFormField(
                decoration: InputDecoration(
                    // hintText: "123111",
                    ),
                controller: controller.newPassController.value,
                onChanged: (value) {
                  controller.newPassNumber(value);
                  print(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

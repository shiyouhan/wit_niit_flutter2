// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/mine_controller.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/info_phone_num_view.dart';

import '../../../data/base_style.dart';
import '../../../data/theme_data.dart';
import '../controllers/info_phone_num_controller.dart';

class InfoPhoneView extends GetView {
  const InfoPhoneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    InfoPhoneNumController phoneNumController =
        Get.put(InfoPhoneNumController());
    MineController mineController = Get.put(MineController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '手机号',
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
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 58.h),
          Center(
            child: SizedBox(
              width: 112.w,
              height: 112.h,
              child: Image(
                image: NetworkImage('http://img.syhan.top/uPic/iphone.png'),
              ),
            ),
          ),
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '当前手机号：',
                style: BaseStyle.fs16,
              ),
              Text(
                mineController.phone.value,
                style: BaseStyle.fs16,
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Column(
            children: [
              Text(
                '此手机号将显示在个人信息中，',
                style: BaseStyle.fs14G,
              ),
              Text(
                '你也可以使用此手机号登录。',
                style: BaseStyle.fs14G,
              )
            ],
          ),
          SizedBox(height: 40.h),
          GestureDetector(
            onTap: () => Get.to(InfoPhoneNumView()),
            child: Container(
              width: size.width * 0.7,
              height: 44.h,
              decoration: BoxDecoration(
                color: Config.primarySwatchColor.shade50,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.r),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '更换手机号',
                style: BaseStyle.fs16.copyWith(color: Colors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }
}

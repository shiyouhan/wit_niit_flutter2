import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';

import '../../../data/theme_data.dart';

class SetAccountWxView extends GetView {
  const SetAccountWxView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '微信',
          style: BaseStyle.fs16,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 114.h),
          Center(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0.r),
                  child: SizedBox(
                    width: 62.w,
                    height: 62.h,
                    child: Image.network(
                      'http://img.syhan.top/uPic/avatar.JPG',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '当前微信:',
                      style: BaseStyle.fs16,
                    ),
                    Text(
                      '施友涵',
                      style: BaseStyle.fs16,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  '可使用当前绑定的微信登录',
                  style: BaseStyle.fs14G,
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  // onTap: () => Get.to(InfoPhoneNumView()),
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
                      '更换微信',
                      style: BaseStyle.fs16.copyWith(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  '仅支持更换实名为“施友涵”的微信',
                  style: BaseStyle.fs12G,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

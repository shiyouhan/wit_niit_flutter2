// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/set_language_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/set_storage_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/set_theme_view.dart';

import '../../../data/theme_data.dart';

class SetCurrencyView extends GetView {
  const SetCurrencyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '通用',
          style: BaseStyle.fs16,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 18.h),
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () => Get.to(SetThemeView()),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '深色模式',
                    style: BaseStyle.fs16,
                  ),
                  Text(
                    '跟随系统',
                    style: BaseStyle.fs16.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ),
          Container(
            height: 1.h,
            margin: EdgeInsets.only(left: 16.0),
            color: Config.primarySwatchColor.shade50,
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () => Get.to(SetLanguageView()),
              title: Text(
                '语言',
                style: BaseStyle.fs16,
              ),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () => Get.to(SetStorageView()),
              title: Text(
                '存储空间',
                style: BaseStyle.fs16,
              ),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ),
        ],
      ),
    );
  }
}

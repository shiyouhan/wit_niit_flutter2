// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/set_currency_view.dart';

import '../../../data/theme_data.dart';
import '../controllers/set_language_controller.dart';

class SetLanguageView extends GetView {
  const SetLanguageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SetLanguageController controller = Get.put(SetLanguageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '语言',
          style: BaseStyle.fs16,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => {Get.to(SetCurrencyView())},
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 18.0),
              child: Text(
                '保存',
                style: BaseStyle.fs16.copyWith(color: Colors.grey),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Obx(
            () => Container(
              color: Colors.white,
              child: ListTile(
                onTap: () => controller.languageOne(),
                title: Text(
                  '跟随系统语言',
                  style: BaseStyle.fs16,
                ),
                trailing: controller.isSelected.value == 0
                    ? Icon(
                        Icons.check,
                        color: Colors.blue,
                      )
                    : Container(
                        width: 1.w,
                      ),
              ),
            ),
          ),
          Container(
            height: 1.h,
            margin: EdgeInsets.only(left: 16.0),
            color: Config.primarySwatchColor.shade50,
          ),
          Obx(
            () => Container(
              color: Colors.white,
              child: ListTile(
                onTap: () => controller.languageTwo(),
                title: Text(
                  '简体中文',
                  style: BaseStyle.fs16,
                ),
                trailing: controller.isSelected.value == 1
                    ? Icon(
                        Icons.check,
                        color: Colors.blue,
                      )
                    : Container(
                        width: 1.w,
                      ),
              ),
            ),
          ),
          Container(
            height: 1.h,
            margin: EdgeInsets.only(left: 16.0),
            color: Config.primarySwatchColor.shade50,
          ),
          Obx(
            () => Container(
              color: Colors.white,
              child: ListTile(
                onTap: () => controller.languageThree(),
                title: Text(
                  'English',
                  style: BaseStyle.fs16,
                ),
                trailing: controller.isSelected.value == 2
                    ? Icon(
                        Icons.check,
                        color: Colors.blue,
                      )
                    : Container(
                        width: 1.w,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

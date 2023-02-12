// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';

import '../../../data/theme_data.dart';
import '../controllers/set_theme_controller.dart';

class SetThemeView extends GetView {
  const SetThemeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SetThemeController controller = Get.put(SetThemeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '深色模式',
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
              child: ListTile(
                title: Text(
                  '跟随系统',
                  style: BaseStyle.fs16,
                ),
                subtitle: Text(
                  '开启后，将跟随系统打开或者关闭深色模式',
                  style: BaseStyle.fs12G,
                ),
                trailing: CupertinoSwitch(
                  activeColor: Config.primaryColor,
                  trackColor: Config.primarySwatchColor.shade50,
                  value: controller.flag.value,
                  onChanged: (value) {
                    controller.themeSwitch();
                    print(value);
                  },
                ),
              ),
            ),
          ),
          Obx(
            () => controller.flag.value == false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // height: 30.h,
                        padding:
                            EdgeInsets.only(left: 16.0, top: 12.0, bottom: 4.0),
                        child: Text(
                          '手动选择',
                          style: BaseStyle.fs12G,
                        ),
                      ),
                      Obx(
                        () => Container(
                          color: Colors.white,
                          child: ListTile(
                            onTap: () => controller.selectOne(),
                            title: Text(
                              '普通模式',
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
                      ),
                      Obx(
                        () => Container(
                          color: Colors.white,
                          child: ListTile(
                            onTap: () => controller.selectTwo(),
                            title: Text(
                              '深色模式',
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
                    ],
                  )
                : Spacer(),
          )
        ],
      ),
    );
  }
}

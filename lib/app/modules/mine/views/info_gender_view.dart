// ignore_for_file: prefer_const_constructors, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../data/base_style.dart';
import '../../../data/theme_data.dart';
import '../controllers/info_gender_controller.dart';
import '../controllers/mine_controller.dart';

class InfoGenderView extends GetView<InfoGenderController> {
  InfoGenderView({Key? key}) : super(key: key);

  // InfoGenderController controller = Get.put(InfoGenderController());

  @override
  Widget build(BuildContext context) {
    InfoGenderController controller = Get.put(InfoGenderController());
    MineController mineController = Get.put(MineController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '性别',
          style: BaseStyle.fs16W.copyWith(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Config.primarySwatchColor.shade50,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => {},
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            Container(
              color: Colors.white,
              height: 56.h,
              width: size.width,
              child: ListTile(
                // selected: mineController.gender.value == 'M',
                title: Text(
                  '男',
                  style: BaseStyle.fs16.copyWith(color: Colors.black),
                ),
                trailing: SizedBox(
                  width: size.width / 10,
                  child: Obx(
                    () => mineController.gender.value == 'M'
                        ? Icon(
                            Icons.check,
                            color: Colors.blue,
                          )
                        : Container(),
                  ),
                ),
                onTap: () => {
                  controller.selectM(),
                  controller.userEdit(),
                },
              ),
            ),
            Container(
              height: 1.h,
              color: Config.primarySwatchColor.shade50,
              margin: EdgeInsets.only(left: 16.0),
            ),
            Container(
              color: Colors.white,
              width: size.width,
              child: ListTile(
                selected: mineController.gender.value == 'F',
                title: Text(
                  '女',
                  style: BaseStyle.fs16W.copyWith(color: Colors.black),
                ),
                trailing: SizedBox(
                  width: size.width / 10,
                  child: Obx(
                    () => mineController.gender.value == 'F'
                        ? Icon(
                            Icons.check,
                            color: Colors.blue,
                          )
                        : Container(),
                  ),
                ),
                onTap: () => {
                  controller.selectF(),
                  controller.userEdit(),
                },
              ),
            ),
            Container(
              height: 1.h,
              color: Config.primarySwatchColor.shade50,
              margin: EdgeInsets.only(left: 16.0),
            ),
            Container(
              color: Colors.white,
              width: size.width,
              child: ListTile(
                selected: mineController.gender.value == 'U',
                title: Text(
                  '未知',
                  style: BaseStyle.fs16W.copyWith(color: Colors.black),
                ),
                trailing: SizedBox(
                  width: size.width / 10,
                  child: Obx(
                    () => mineController.gender.value == 'U'
                        ? Icon(
                            Icons.check,
                            color: Colors.blue,
                          )
                        : Container(),
                  ),
                ),
                onTap: () => {
                  controller.selectU(),
                  controller.userEdit(),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

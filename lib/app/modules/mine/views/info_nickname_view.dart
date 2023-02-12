// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/person_info_view.dart';

import '../../../data/theme_data.dart';
import '../controllers/info_nickname_controller.dart';
import '../controllers/mine_controller.dart';

class InfoNicknameView extends GetView<InfoNicknameController> {
  const InfoNicknameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InfoNicknameController controller = Get.put(InfoNicknameController());
    MineController mineController = Get.put(MineController());
    FocusNode nicknameFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '姓名',
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
            onTap: () => controller.userEdit(),
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 18.0),
              child: Text(
                '确定',
                style: BaseStyle.fs16.copyWith(color: Colors.grey),
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 12.0,
            ),
            child: Row(
              children: [
                Text(
                  '姓名',
                  style: BaseStyle.fs16.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 36.w),
                Expanded(
                  child: Obx(
                    () => TextField(
                      decoration: InputDecoration(
                        hintText: mineController.name.value,
                        // hintText: "施友涵",
                        border: InputBorder.none,
                      ),
                      focusNode: nicknameFocusNode,
                      controller: controller.nameController.value,
                      onChanged: (value) {
                        controller.usernameEdit(value);
                        print(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 13.0, bottom: 26.0, left: 14.0),
            child: Row(
              children: [
                Text(
                  '管理员己设置成员无法自行修改，',
                  style: BaseStyle.fs14G,
                ),
                Text(
                  '联系管理员',
                  style: BaseStyle.fs14G.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 16.0,
              bottom: 16.0,
              left: 12.0,
              right: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '实名认证',
                  style: BaseStyle.fs16.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      mineController.name.value,
                      // '施友涵',
                      style: BaseStyle.fs16.copyWith(color: Colors.grey),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Text(
                        '已实名',
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

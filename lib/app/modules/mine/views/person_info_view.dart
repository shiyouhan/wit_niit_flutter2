// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/home/views/home_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/info_avatar_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/info_email_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/info_gender_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/info_nickname_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/info_password_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/info_phone_view.dart';

import '../../../data/base_style.dart';
import '../../../data/theme_data.dart';
import '../controllers/info_email_controller.dart';
import '../controllers/info_gender_controller.dart';
import '../controllers/info_nickname_controller.dart';
import '../controllers/info_phone_num_controller.dart';
import '../controllers/mine_controller.dart';

class PersonInfoView extends GetView {
  const PersonInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    InfoGenderController genderController = Get.put(InfoGenderController());
    InfoNicknameController nicknameController =
        Get.put(InfoNicknameController());
    InfoPhoneNumController phoneNumController =
        Get.put(InfoPhoneNumController());
    InfoEmailController emailController = Get.put(InfoEmailController());
    MineController mineController = Get.put(MineController());
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息', style: BaseStyle.fs16),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Get.to(HomeView()),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Get.to(InfoAvatarView()),
              child: Container(
                height: 90.h,
                color: Colors.white,
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '头像',
                      style: BaseStyle.fs16,
                    ),
                    Expanded(child: Container()),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0.r),
                      child: SizedBox(
                        width: 64.w,
                        height: 64.h,
                        child: Image.network(
                          mineController.photo.value,
                          // 'https://cdn.syhan.top/uPic/avatar.JPG',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Config.primarySwatchColor.shade100,
                    ),
                    SizedBox(width: 16.w),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 1.h,
              color: Config.primarySwatchColor.shade50,
              margin: const EdgeInsets.only(left: 16.0),
            ),
            GestureDetector(
              onTap: () => Get.to(InfoNicknameView()),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "姓名",
                        style: BaseStyle.fs16,
                      ),
                      Obx(
                        () => Text(
                          mineController.name.value,
                          // '施友涵',
                          style: BaseStyle.fs14G,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Config.primarySwatchColor.shade100,
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 1.h,
              color: Config.primarySwatchColor.shade50,
              margin: const EdgeInsets.only(left: 16.0),
            ),
            GestureDetector(
              onTap: () => Get.to(InfoGenderView()),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "性别",
                        style: BaseStyle.fs16,
                      ),
                      Obx(
                        // () => genderController.isSelected.value
                        () => Text(
                          mineController.gender.value == 'M'
                              ? '男'
                              : (mineController.gender.value == 'F'
                                  ? '女'
                                  : '未知'),
                          style: BaseStyle.fs14G,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Config.primarySwatchColor.shade100,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              color: Colors.white,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "对外信息展示",
                          style: BaseStyle.fs16,
                        ),
                        SizedBox(width: 3.w),
                        Icon(
                          Icons.add_circle,
                          size: 20,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Text(
                            mineController.name.value,
                            // "施友涵",
                            style: BaseStyle.fs14G,
                          ),
                        ),
                        Text(
                          "@AI南工",
                          style: BaseStyle.fs14G.copyWith(color: Colors.orange),
                        )
                      ],
                    )
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Config.primarySwatchColor.shade100,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              color: Colors.white,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Text(
                  "工作签名",
                  style: BaseStyle.fs16,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Config.primarySwatchColor.shade100,
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 1.h,
              color: Config.primarySwatchColor.shade50,
              margin: const EdgeInsets.only(left: 16.0),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "所属企业",
                      style: BaseStyle.fs16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.add_circle,
                          size: 20,
                          color: Colors.green,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          "@AI南工",
                          style: BaseStyle.fs14G,
                        )
                      ],
                    )
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Config.primarySwatchColor.shade100,
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 1.h,
              color: Config.primarySwatchColor.shade50,
              margin: const EdgeInsets.only(left: 16.0),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                onTap: () => Get.to(() => InfoPasswordView()),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                title: Text(
                  "重置密码",
                  style: BaseStyle.fs16,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Config.primarySwatchColor.shade100,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () => Get.to(InfoPhoneView()),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "手机",
                        style: BaseStyle.fs16,
                      ),
                      Text(
                        mineController.phone.value,
                        // "18018384983",
                        style: BaseStyle.fs14G,
                      )
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Config.primarySwatchColor.shade100,
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 1.h,
              color: Config.primarySwatchColor.shade50,
              margin: const EdgeInsets.only(left: 16.0),
            ),
            GestureDetector(
              onTap: () => Get.to(InfoEmailView()),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "邮箱",
                        style: BaseStyle.fs16,
                      ),
                      Obx(() => Text(
                            emailController.email.value.isNotEmpty == false
                                ? '未绑定'
                                : emailController.email.value.toString(),
                            style: BaseStyle.fs14G,
                          ))
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Config.primarySwatchColor.shade100,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              color: Colors.white,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                title: Obx(
                  () => Text(
                    mineController.classes.value,
                    // "软件2126",
                    style: BaseStyle.fs14G.copyWith(color: Colors.black),
                  ),
                ),
                subtitle: Obx(
                  () => Text(
                    '${mineController.college.value}学院/${mineController.classes.value}/${mineController.sno.value}',
                    style: BaseStyle.fs14G,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Config.primarySwatchColor.shade100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/set_account_dd_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/set_account_wx_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/info_phone_view.dart';

import '../../../data/theme_data.dart';
import '../controllers/info_phone_num_controller.dart';

class SetAccountSecurityView extends GetView {
  const SetAccountSecurityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    InfoPhoneNumController phoneNumController =
        Get.put(InfoPhoneNumController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '账号与安全',
            style: BaseStyle.fs16,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () => Get.to(SetAccountWxView()),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "微信",
                        style: BaseStyle.fs16,
                      ),
                      Text(
                        // nicknameController.text.value.toString(),
                        '施友涵',
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
              onTap: () => Get.to(SetAccountDdView()),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "钉钉",
                        style: BaseStyle.fs16,
                      ),
                      Text(
                        // nicknameController.text.value.toString(),
                        '施友涵',
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
              onTap: () => Get.to(InfoPhoneView()),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "手机号",
                        style: BaseStyle.fs16,
                      ),
                      Text(
                        phoneNumController.phone.value.toString(),
                        // '18018384983',
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
            )
          ],
        ));
  }
}

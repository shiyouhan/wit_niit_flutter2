// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/modules/login/controllers/start_controller.dart';
import 'package:wit_niit_flutter2/app/modules/login/views/login_view.dart';

import '../../../data/theme_data.dart';
import 'logon_view.dart';

class StartView extends GetView<StartController> {
  const StartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    StartController controller = Get.put(StartController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: size.height,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(height: 100.h),
              SizedBox(
                width: 100.w,
                height: 100.h,
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(height: 6.h),
              Text(
                '智慧南工',
                style: BaseStyle.fs18Wb.copyWith(
                  color: Config.primaryColor,
                ),
              ),
              Spacer(),
              Obx(() => Column(
                    children: [
                      GestureDetector(
                        onTap: () => {
                          if (controller.isSelected.value == false)
                            {
                              EasyLoading.showToast('请选中并同意下方协议'),
                            }
                          else
                            Get.to(() => LoginView()),
                        },
                        child: Container(
                          width: size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.blue,
                          ),
                          child: Text(
                            '手机号登录',
                            style:
                                BaseStyle.fs14G.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          if (controller.isSelected.value == false)
                            {
                              EasyLoading.showToast('请选中并同意下方协议'),
                            }
                          else
                            Get.to(() => LogonView()),
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '手机号注册',
                            style: BaseStyle.fs14G.copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: true,
                            groupValue: controller.isSelected.value,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              controller.radioSelect(value);
                              print(value);
                            },
                          ),
                          Text('已阅读并同意软件许可及服务协议和隐私政策')
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

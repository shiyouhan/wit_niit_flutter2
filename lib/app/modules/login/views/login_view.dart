// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_data.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/data/theme_data.dart';
import 'package:wit_niit_flutter2/app/modules/login/controllers/login_controller.dart';
import 'package:wit_niit_flutter2/app/modules/login/views/reset_password_view.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseData.bodyColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Code(countdown: 60),
      ),
    );
  }
}

class Code extends StatefulWidget {
  Code({Key? key, required this.countdown}) : super(key: key);

  /// 倒计时的秒数，默认60秒。
  int countdown;

  @override
  State<Code> createState() => _CodeState();
}

class _CodeState extends State<Code> {
  LoginController controller = Get.put(LoginController());
  bool _isAvailableGetVCode = true; //是否可以获取验证码，默认为`false`
  String _verifyStr = '获取验证码';

  /// 倒计时的计时器。
  late Timer _timer;

  /// 当前倒计时的秒数。
  late int _seconds;

  @override
  void initState() {
    super.initState();
    _seconds = widget.countdown;
  }

  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds--;
      _isAvailableGetVCode = false;
      _verifyStr = '${_seconds}s后重发';
      if (_seconds == 0) {
        _verifyStr = '重新获取';
        _isAvailableGetVCode = true;
        _seconds = widget.countdown;
        _cancelTimer();
      }
      setState(() {});
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    late String phoneStr = controller.phone.value
        .toString()
        .replaceFirst(RegExp(r'\d{4}'), '****', 3);

    return SizedBox(
      height: size.height,
      child: Obx(
        () => controller.isShow.value == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    '手机号登录',
                    style: BaseStyle.wdStyle.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '手机号',
                    style: BaseStyle.fs14G,
                  ),
                  Obx(
                    () => TextFormField(
                      // decoration: InputDecoration(
                      //   hintText: "18018384983",
                      // ),
                      controller: controller.phoneController.value,
                      onChanged: (value) {
                        controller.phoneNumber(value);
                        print(value);
                      },
                    ),
                  ),
                  Obx(
                    () => controller.loginPass.value == false
                        ? Column(
                            children: [
                              GestureDetector(
                                onTap: () => controller.passwordLogin(),
                                child: Container(
                                  height: 60.h,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    '密码登录',
                                    style: BaseStyle.fs12G,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  controller.getVerify(),
                                  controller.openShow(),
                                  _startTimer(),
                                },
                                child: Container(
                                  width: size.width,
                                  height: 42.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.blue,
                                  ),
                                  child: Text(
                                    '下一步',
                                    style: BaseStyle.fs14G.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Obx(
                                () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.h),
                                    Text(
                                      '密码',
                                      style: BaseStyle.fs14G,
                                    ),
                                    TextFormField(
                                      // decoration: InputDecoration(
                                      //   hintText: "123123",
                                      // ),
                                      controller:
                                          controller.passwordController.value,
                                      onChanged: (value) {
                                        controller.passwordNumber(value);
                                        print(value);
                                      },
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4),
                                      child: GestureDetector(
                                        onTap: () =>
                                            Get.to(() => ResetPasswordView()),
                                        child: Text(
                                          '忘记密码?',
                                          style: BaseStyle.fs14G,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.h),
                              GestureDetector(
                                onTap: () => {
                                  controller.passLogin(),
                                  controller.getUser(),
                                },
                                child: Container(
                                  width: size.width,
                                  height: 42.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.blue,
                                  ),
                                  child: Text(
                                    '登录',
                                    style: BaseStyle.fs14G.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    '验证手机',
                    style: BaseStyle.wdStyle.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    // '验证码已发送至 + 86 $phoneStr',
                    '验证码已发送至 + 86 $phoneStr',
                    style: BaseStyle.fs14G,
                  ),
                  Row(
                    children: [
                      Obx(() => Container(
                            width: size.width * 0.60,
                            child: TextField(
                              controller: controller.codeController.value,
                              onChanged: (value) {
                                controller.codeNumber(value);
                                print(value);
                              },
                            ),
                          )),
                      SizedBox(width: 6.w),
                      GestureDetector(
                        onTap: _seconds == widget.countdown
                            ? () {
                                _startTimer();
                              }
                            : null,
                        child: Container(
                          //width: size.width / 4,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 4,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.w,
                                color: Config.primarySwatchColor.shade50),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            _verifyStr,
                            style: BaseStyle.fs14G,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60.h),
                  GestureDetector(
                    onTap: () => {
                      controller.login(),
                      // controller.getUser(),
                      controller.closeShow(),
                    },
                    child: Container(
                      width: size.width,
                      height: 42.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.blue,
                      ),
                      child: Text(
                        '登录',
                        style: BaseStyle.fs14G.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

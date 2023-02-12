// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/person_info_view.dart';

import '../../../data/theme_data.dart';
import '../controllers/info_email_controller.dart';

class InfoEmailView extends GetView<InfoEmailController> {
  const InfoEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '邮箱',
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
            onTap: () => controller.changePhone(),
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
      body: EmailCode(countdown: 60),
    );
  }
}

class EmailCode extends StatefulWidget {
  EmailCode({Key? key, required this.countdown}) : super(key: key);

  /// 倒计时的秒数，默认60秒。
  int countdown;

  @override
  State<EmailCode> createState() => _EmailCodeState();
}

class _EmailCodeState extends State<EmailCode> {
  InfoEmailController controller = Get.put(InfoEmailController());
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
    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
          color: Colors.white,
          width: size.width,
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 12.0,
          ),
          child: Row(
            children: [
              Text(
                '邮箱',
                style: BaseStyle.fs16.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 36.w),
              Expanded(
                child: Obx(
                  () => TextField(
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      // hintText: controller.email.value,
                      border: InputBorder.none,
                    ),
                    controller: controller.emailController.value,
                    onChanged: (value) {
                      controller.emailEdit(value);
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
                '确定是否绑定该邮箱，确定后请',
                style: BaseStyle.fs14G,
              ),
              Obx(
                () => controller.emailController.value.text.isNotEmpty == true
                    ? GestureDetector(
                        onTap: () => {
                          controller.getEmailCode(),
                          _startTimer(),
                        },
                        child: Text(
                          '发送验证码',
                          style: BaseStyle.fs14G.copyWith(color: Colors.blue),
                        ),
                      )
                    : Text(
                        '发送验证码',
                        style: BaseStyle.fs14G.copyWith(color: Colors.blue),
                      ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => SizedBox(
                    width: size.width * 0.70,
                    child: TextField(
                      controller: controller.codeController.value,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
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
                        width: 1.w, color: Config.primarySwatchColor.shade50),
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
        ),
        Spacer()
      ],
    );
  }
}

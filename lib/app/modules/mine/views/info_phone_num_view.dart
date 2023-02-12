// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/person_info_view.dart';

import '../../../data/theme_data.dart';
import '../controllers/info_phone_num_controller.dart';

class InfoPhoneNumView extends GetView {
  const InfoPhoneNumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    InfoPhoneNumController controller = Get.put(InfoPhoneNumController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '更换手机号',
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
            onTap: () => {controller.changePhone()},
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
      body: ChangePhoneView(countdown: 60),
    );
  }
}

class ChangePhoneView extends StatefulWidget {
  ChangePhoneView({Key? key, required this.countdown}) : super(key: key);

  /// 倒计时的秒数，默认60秒。
  int countdown;

  @override
  State<ChangePhoneView> createState() => _ChangePhoneViewState();
}

class _ChangePhoneViewState extends State<ChangePhoneView> {
  InfoPhoneNumController controller = Get.put(InfoPhoneNumController());
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50.h),
        Padding(
          padding: EdgeInsets.all(4),
          child: Text(
            '手机号',
            style: BaseStyle.fs14G,
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Obx(
            () => TextFormField(
              decoration: InputDecoration(
                // hintText: "18013832055",
                border: InputBorder.none,
              ),
              controller: controller.phoneController.value,
              onChanged: (value) {
                controller.phoneNumber(value);
                RegExp reg = RegExp(r'^\d{11}$');
                if (reg.hasMatch(value)) {
                  controller.show();
                  _startTimer();
                }
                print(value);
              },
            ),
          ),
        ),
        Obx(
          () => controller.isShow.value == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        '验证码',
                        style: BaseStyle.fs14G,
                      ),
                    ),
                    _sendCode(),
                  ],
                )
              : Container(),
        ),
      ],
    );
  }

  Widget _sendCode() {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => SizedBox(
                width: size.width * 0.70,
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
    );
  }
}

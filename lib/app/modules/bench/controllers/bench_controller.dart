import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/entrance_view.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/health_view.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/information_home.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/leave_view.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/live_pages.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/network_fault_home.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/option_data.dart';

import '../views/notice_page_view.dart';

class BenchController extends GetxController {
  //TODO: Implement BenchController

  final count = 0.obs;

  List<Option> optionList = [
    // Option(Icons.h_plus_mobiledata_rounded, '成功', (() {
    //   Get.to(SubmitSuccessPage());
    // })),
    Option(Icons.time_to_leave_outlined, '请假', () {
      Get.to(LeaveView());
    }),
    Option(Icons.generating_tokens_sharp, "智慧入校", () {
      Get.to(EntranceView());
    }),
    Option(Icons.live_tv, '上课直播', () {
      Get.to(LivePage());
    }),
    Option(Icons.handshake, '健康上报', () {
      Get.to(HealthView());
    }),
    Option(Icons.integration_instructions, '网络故障', () {
      Get.to(NetworkFaultHomePage());
    }),
    Option(Icons.real_estate_agent_outlined, '南工资讯', () {
      Get.to(InformationHomePage());
    }),
    Option(Icons.no_adult_content_rounded, '通知公告', () {
      Get.to(NoticePageView());
    })
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

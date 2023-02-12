import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/main.dart';

class LiveController extends GetxController {
  //TODO: Implement HealthController
  var textController = TextEditingController().obs;
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

  void getLeave(){
    request.get("only/history",params: {"id":"13"});
  }
}

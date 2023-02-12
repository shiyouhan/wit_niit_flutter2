import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/tools/controllers/smart_controller.dart';

class DevicesAddView extends GetView {
  DevicesAddView({Key? key}) : super(key: key);
  SmartController _controller = Get.put(SmartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '设备添加',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              tip_message("deviceNum"),
              popSelect(),
              tip_message("deviceName"),
              input_box("deviceName", _controller.deviceNameTextController),
              tip_message("clientId"),
              input_box("clientId", _controller.clientIdTextController),
              tip_message("deviceUsername"),
              input_box(
                  "deviceUsername", _controller.deviceUsernameTextController),
              tip_message("devicePassword"),
              input_box(
                  "devicePassword", _controller.devicePasswordTextController),
              tip_message("topic"),
              input_box("topic", _controller.topicTextController),
              subButton(context)
            ],
          ),
        ),
      ),
    );
  }

  //提示文版
  Widget tip_message(String message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        message,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
      ),
    );
  }

  //输入框样式
  Widget input_box(String tip, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: tip,
          border: InputBorder.none,
        ),
      ),
    );
  }

  //添加按钮
  Widget subButton(context) {
    return MaterialButton(
      onPressed: _controller.add_device,
      child: Center(
        child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Text(
              "ADD DEVICE",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }

  //下拉选择框
  Widget popSelect() {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: PopupMenuButton<String>(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return Text(
                  _controller.showDeviceType.value,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 20.sp),
                );
              }),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
        // icon: Icon(Icons.arrow_drop_down),
        itemBuilder: (context) {
          return <PopupMenuEntry<String>>[]..addAll(_controller.device_type
              .map((e) => PopupMenuItem<String>(
                    value: e["typeName"],
                    child: Text(e["typeName"]),
                    onTap: () {
                      _controller.deviceNumTextController.text =
                          e["id"].toString();
                      _controller.showDeviceType.value =
                          e["typeName"].toString();
                    },
                  ))
              .toList());
        },
      ),
    );
  }
}

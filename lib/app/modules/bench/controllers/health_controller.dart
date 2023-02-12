import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../component/select_menu.dart';
import '../../../data/user_detail_model.dart';

class HealthController extends GetxController {
  //TODO: Implement HealthController

  var leaveStatus = true.obs;
  var display = false.obs;
  var userData = UserDetailModel().obs;

  List<String> textList = [
    "学号",
    "姓名",
    "性别",
    "电话",
    "学院",
    "班级",
    "现在年纪",
    "班主任姓名",
    "班主任电话",
    "住宿地址",
  ];

  List<selectMenuItem> menuList = [
    selectMenuItem(label: "事假", value: '1'),
    selectMenuItem(label: "病假", value: '2'),
    selectMenuItem(label: "其他", value: '3'),
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

  void setDisplay() => display.value = !display.value;

  void setLeaveStatus() => leaveStatus.value = !leaveStatus.value;
// 网络请求
  void userDetail(String userId) async {
    var data = await request.get("/users/getUser/$userId", headers: {
      "token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cGRhdGVkX2F0IjoiMjAyMi0xMS0yMlQwOTowNjo1Ny44NzNaIiwiYWRkcmVzcyI6eyJjb3VudHJ5IjpudWxsLCJwb3N0YWxfY29kZSI6bnVsbCwicmVnaW9uIjpudWxsLCJmb3JtYXR0ZWQiOm51bGx9LCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOmZhbHNlLCJwaG9uZV9udW1iZXIiOiIxMzg1MTgyNjE2NyIsImxvY2FsZSI6bnVsbCwiem9uZWluZm8iOm51bGwsImJpcnRoZGF0ZSI6bnVsbCwiZ2VuZGVyIjoiTSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZW1haWwiOiIxMTQ0MTM5MDk5QHFxLmNvbSIsIndlYnNpdGUiOm51bGwsInBpY3R1cmUiOiJodHRwOi8vMTI0LjIyMS4yMzIuMTU6OTA5MC9obGgvaW1hZ2VfcGlja2VyX2Nyb3BfMTU3MjA5NjMtYWExMy00MDJmLTk0OTgtZDEyODIxZjAyNWUzLmpwZyIsInByb2ZpbGUiOm51bGwsInByZWZlcnJlZF91c2VybmFtZSI6bnVsbCwibmlja25hbWUiOiLmsZ_miLflt53lkbHlkbEiLCJtaWRkbGVfbmFtZSI6bnVsbCwiZmFtaWx5X25hbWUiOm51bGwsImdpdmVuX25hbWUiOm51bGwsIm5hbWUiOiLkvq_mn5AiLCJzdWIiOiI2MzY5ZjYwYmNiNzdmZmQzNzFjNDBhMjQiLCJleHRlcm5hbF9pZCI6bnVsbCwidW5pb25pZCI6bnVsbCwidXNlcm5hbWUiOiJIbGgiLCJkYXRhIjp7InR5cGUiOiJ1c2VyIiwidXNlclBvb2xJZCI6IjYzNjhiMTA2YzU1YzhiMzkzNGE4ZTBmZSIsImFwcElkIjoiNjM2OWZlOGZmY2M3YTZjYzlmMjAyN2FjIiwiaWQiOiI2MzY5ZjYwYmNiNzdmZmQzNzFjNDBhMjQiLCJ1c2VySWQiOiI2MzY5ZjYwYmNiNzdmZmQzNzFjNDBhMjQiLCJfaWQiOiI2MzY5ZjYwYmNiNzdmZmQzNzFjNDBhMjQiLCJwaG9uZSI6IjEzODUxODI2MTY3IiwiZW1haWwiOiIxMTQ0MTM5MDk5QHFxLmNvbSIsInVzZXJuYW1lIjoiSGxoIiwidW5pb25pZCI6bnVsbCwib3BlbmlkIjpudWxsLCJjbGllbnRJZCI6IjYzNjhiMTA2YzU1YzhiMzkzNGE4ZTBmZSJ9LCJ1c2VycG9vbF9pZCI6IjYzNjhiMTA2YzU1YzhiMzkzNGE4ZTBmZSIsImF1ZCI6IjYzNjlmZThmZmNjN2E2Y2M5ZjIwMjdhYyIsImV4cCI6MTY3MDMyNTEyOCwiaWF0IjoxNjY5MTE1NTI4LCJpc3MiOiJodHRwczovL3NtYXJ0c2Nob29sLmF1dGhpbmcuY24vb2lkYyJ9.iW6Z3ZMknRAbx-YRMp9LdMU--kT9q-XqiMRzP5D57s4"
    });
    userData.value = UserDetailModel.fromJson(data);
  }
}

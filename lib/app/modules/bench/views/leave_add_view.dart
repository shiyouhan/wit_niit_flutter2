import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_add_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/leave_type.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/teachers_view.dart';
import 'package:wit_niit_flutter2/app/widget/chl_radio.dart';
import 'package:wit_niit_flutter2/app/widget/required.dart';

class LeaveAddView extends GetView<LeaveAddController> {
  const LeaveAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LeaveAddController controller = Get.put(LeaveAddController());
    LeaveController leaveController = Get.put(LeaveController());
    return Scaffold(
        appBar: AppBar(
          title: Text('请假新增'),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                      child: Form(
                        key: controller.formKey.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "详细信息",
                              style: BaseStyle.testFontBold,
                            ),
                            Divider(color: Colors.grey),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: leaveController.textList.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          leaveController.textList[index],
                                          style: BaseStyle.testFont,
                                        ),
                                      ),
                                      Expanded(flex: 4, child: Text("待展示数据"))
                                    ],
                                  );
                                }),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 40,
                              child: Text(
                                "请假信息",
                                style: BaseStyle.testFontBold,
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            // SelectMenu(
                            //   items: leaveController.menuList,
                            //   title: "请假类型",
                            // ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: chlRequired(
                                      text: Text(
                                    "请假类型",
                                  )),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: TextButton(
                                        onPressed: () {
                                          Get.to(() => LeaveType());
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Obx(() {
                                              return Text(
                                                controller
                                                    .leaveFromModel.value.type!,
                                                style: BaseStyle.testFont,
                                              );
                                            }),
                                            Icon(Icons.arrow_right)
                                          ],
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "说明",
                              style: BaseStyle.testFontBold,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("1、请选择开始时间和请假结束时间，且结束时间要迟于开始时间。"),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "2、请假总天数按照自然天计算，时长不足12小时按半天计算。时长超过当天12小时，请假天数按一天计算。以此类推计算"),
                            SizedBox(
                              height: 5,
                            ),
                            Text("3、请假结束时间即为销假时间，请在此时间前销假。"),
                            SizedBox(
                              height: 5,
                            ),
                            MaterialButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                DatePicker.showDateTimePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    maxTime: DateTime(2024, 6, 7, 05, 09),
                                    onConfirm: (date) {
                                  controller.setStarDate(date);
                                }, locale: LocaleType.zh);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: chlRequired(
                                      text: Text(
                                        "请选择开始日期",
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(() {
                                          return Text(
                                            controller.leaveFromModel.value
                                                .createdTime!,
                                            style: BaseStyle.testFont,
                                          );
                                        }),
                                        true
                                            ? const Icon(Icons.arrow_right)
                                            : const Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            MaterialButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                DatePicker.showDateTimePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    maxTime: DateTime(2024, 6, 7, 05, 09),
                                    onConfirm: (date) {
                                  controller.setEndDate(date);
                                }, locale: LocaleType.zh);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        chlRequired(
                                          text: Text(
                                            "请选择结束日期",
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(() {
                                          return Text(
                                            controller
                                                .leaveFromModel.value.deadline!,
                                            style: BaseStyle.testFont,
                                          );
                                        }),
                                        true
                                            ? const Icon(Icons.arrow_right)
                                            : const Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          "请假天数：",
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(controller
                                            .leaveFromModel.value.days
                                            .toString())),
                                  ],
                                )),
                            Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: chlRequired(
                                    text: Text("请假事由"),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: TextField(
                                    controller:
                                        controller.reasonController.value,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "请输入请假事由",
                                    ),
                                    focusNode: controller.focusNode.value,
                                    maxLines: 5,
                                    onChanged: (v) {
                                      controller.words.value = controller
                                          .reasonController.value.text.length;
                                      controller.leaveFromModel.value.reason =
                                          controller
                                              .reasonController.value.text;
                                    },
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Obx(() => Text(
                                      controller.words.value.toString(),
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    )),
                                Text("/1000"),
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Text("支撑材料"),
                            OutlinedButton(
                              onPressed: () {},
                              child: Column(
                                children: [Icon(Icons.camera_alt), Text("图片")],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: chlRequired(
                                      text: Text(
                                    "手机号",
                                  )),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: TextField(
                                      focusNode: controller.focusNode.value,
                                      controller:
                                          controller.numberController.value,
                                      onChanged: (v) {
                                        controller.leaveFromModel.value.number =
                                            controller
                                                .reasonController.value.text;
                                      },
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            _radio(),
                            // Obx(() {
                            //   return controller.occupyGroup.value == 0
                            //       ? Column(
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.start,
                            //           children: <Widget>[
                            //             Padding(
                            //               padding: EdgeInsets.only(left: 12),
                            //               child: Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: <Widget>[
                            //                   Text(
                            //                     "涉及到课程任课老师",
                            //                     style: TextStyle(height: 1),
                            //                   ),
                            //                   Text(
                            //                       "1、请假耽误上课，请选择相关任课老师\n2、外聘教室暂时无法选择，可为空\n3、请假不影响上课的，可为空"),
                            //                 ],
                            //               ),
                            //             ),
                            //             Divider(
                            //               color: Colors.grey,
                            //             ),
                            //             Row(
                            //               children: [
                            //                 Expanded(
                            //                   flex: 4,
                            //                   child: chlRequired(
                            //                       text: Text(
                            //                     controller.teachers.value[0],
                            //                     // softWrap: true,
                            //                     overflow: TextOverflow.ellipsis,
                            //                   )),
                            //                 ),
                            //                 Expanded(
                            //                     flex: 2,
                            //                     child: TextButton(
                            //                         onPressed: () {
                            //                           Get.to(
                            //                               () => TeachersView());
                            //                         },
                            //                         child: Row(
                            //                           mainAxisAlignment:
                            //                               MainAxisAlignment
                            //                                   .spaceBetween,
                            //                           children: [
                            //                             Text(
                            //                               "请选择",
                            //                               style: BaseStyle
                            //                                   .testFont,
                            //                             ),
                            //                             Icon(Icons.arrow_right)
                            //                           ],
                            //                         )))
                            //               ],
                            //             ),
                            //           ],
                            //         )
                            //       : Container();
                            // }),
                            _radio2(),
                            Row(
                              children: [
                                Text("申请时间"),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(controller
                                    .leaveFromModel.value.applicationTime!)
                              ],
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.greenAccent,
                              ),
                              onPressed: () {
                                controller.addLeave();
                              },
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Center(child: Text("提交"))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _radio() {
    return Row(
      children: [
        chlRequired(text: Text("是否占用\n课程")),
        Row(
          children: [
            Obx(() {
              return Radio(
                ///此单选框绑定的值 必选参数
                value: 0,

                ///当前组中这选定的值  必选参数
                groupValue: controller.occupyGroup.value,

                ///点击状态改变时的回调 必选参数
                onChanged: (v) {
                  print(v);
                  controller.occupyGroup.value = v! as int;
                  controller.leaveFromModel.value.occupy = true;
                },
              );
            }),
            Text("是")
          ],
        ),
        Row(
          children: [
            Obx(() {
              return Radio(
                ///此单选框绑定的值 必选参数
                value: 1,

                ///当前组中这选定的值  必选参数
                groupValue: controller.occupyGroup.value,

                ///点击状态改变时的回调 必选参数
                onChanged: (v) {
                  print(v);
                  controller.occupyGroup.value = v! as int;
                  controller.leaveFromModel.value.occupy = false;
                },
              );
            }),
            Text("否")
          ],
        ),
      ],
    );
  }

  Widget _radio2() {
    return Row(
      children: [
        chlRequired(text: Text("是否出校")),
        Row(
          children: [
            Obx(() {
              return Radio(
                ///此单选框绑定的值 必选参数
                value: 0,

                ///当前组中这选定的值  必选参数
                groupValue: controller.outGroup.value,

                ///点击状态改变时的回调 必选参数
                onChanged: (v) {
                  print(v);
                  controller.outGroup.value = v! as int;
                  controller.leaveFromModel.value.out = true;
                },
              );
            }),
            Text("是")
          ],
        ),
        Row(
          children: [
            Obx(() {
              return Radio(
                ///此单选框绑定的值 必选参数
                value: 1,

                ///当前组中这选定的值  必选参数
                groupValue: controller.outGroup.value,

                ///点击状态改变时的回调 必选参数
                onChanged: (v) {
                  print(v);
                  controller.outGroup.value = v! as int;
                  controller.leaveFromModel.value.out = false;
                },
              );
            }),
            Text("否")
          ],
        ),
      ],
    );
  }
}

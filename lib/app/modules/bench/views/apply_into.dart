import 'package:date_format/date_format.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/apply_into_controller.dart';
import 'package:wit_niit_flutter2/app/widget/required.dart';

class ApplyInto extends GetView<ApplyIntoController> {
  const ApplyInto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplyIntoController controller = Get.put(ApplyIntoController());
    return Scaffold(
        appBar: AppBar(
          title: Text('入校申请'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                chlRequired(text: Text("入校日期")),
                SizedBox(
                  height: 20,
                ),
                Obx(() => Row(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: ButtonStyleButton.allOrNull(
                                Colors.blue.shade50),
                            side: MaterialStateProperty.all(
                              BorderSide(
                                  color: Colors.green,
                                  width: controller.showSide.value ? 3 : 0),
                            ),
                          ),
                          onPressed: () {
                            controller.showSide.value = true;
                          },
                          child: Column(
                            children: [
                              Text(
                                "今天",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              Text(
                                formatDate(DateTime.now(), ["mm", "-", "dd"]),
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: ButtonStyleButton.allOrNull(
                                Colors.blue.shade50),
                            side: MaterialStateProperty.all(
                              BorderSide(
                                  color: Colors.green,
                                  width: controller.showSide.value ? 0 : 3),
                            ),
                          ),
                          onPressed: () {
                            controller.showSide.value = false;
                          },
                          child: Column(
                            children: [
                              Text(
                                "明天",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              Text(
                                formatDate(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        DateTime.now().microsecondsSinceEpoch +
                                            86400),
                                    ["mm", "-", "dd"]),
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    chlRequired(text: Text('苏康码')),
                    OutlinedButton(
                      onPressed: () async {
                        controller.picker.value
                            .pickImage(source: ImageSource.gallery);
                      },
                      child: controller.showImage.value
                          ? Icon(Icons.add)
                          : Container(
                              // decoration: BoxDecoration(
                              //   image:
                              // ),
                              ),
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(
                        BorderSide(color: Colors.black, width: 1),
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text:
                                    '* 请上传本人含核酸检测时间的【苏康码】,入校时核酸检测时效性需符合48小时内要求',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "查看示例",
                                style: TextStyle(
                                    color: Colors.blue.shade200,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("查看示例");
                                  })
                          ])),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    chlRequired(text: Text('行程码')),
                    OutlinedButton(
                      onPressed: () async {
                        controller.picker.value
                            .pickImage(source: ImageSource.gallery);
                      },
                      child: controller.showImage.value
                          ? Icon(Icons.add)
                          : Container(
                              // decoration: BoxDecoration(
                              //   image:
                              // ),
                              ),
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(
                        BorderSide(color: Colors.black, width: 1),
                      )),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                _radioCard(
                  title: 'Q1:',
                  subTitle: '同行人双码是否全绿',
                  radio1: '全绿码',
                  radio2: '非全绿码',
                  group: 1,
                ),
                SizedBox(
                  height: 15,
                ),
                _radioCard(
                  title: 'Q2:',
                  subTitle: '同住人有无中高风险地区行程史',
                  radio1: '无',
                  radio2: '有',
                  group: 2,
                ),
                SizedBox(
                  height: 15,
                ),
                _radioCard(
                  title: 'Q3:',
                  subTitle: '本人是否有发热、干咳、乏力、鼻塞流涕、咽痛、嗅觉/味觉减退、结膜炎、肌痛、腹泻等症状',
                  radio1: '无',
                  radio2: '有',
                  group: 3,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Obx(() {
                      return Checkbox(
                        value: controller.checkValue.value,
                        onChanged: (v) {
                          controller.checkValue.value =
                              !controller.checkValue.value;
                        },
                      );
                    }),
                    Expanded(
                      child: Column(
                        children: [
                          Text("本人承诺以上信息真实有效，如有虚假本人承担一切责任"),
                        ],
                      ),
                    ),
                    Text.rich(TextSpan(children: [
                      // Checkbox(
                      //   value: false,
                      //   onChanged: (v) {},
                      // ),
                    ]))
                  ],
                ),
                SizedBox(height: 15,),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: () {},
                  child: SizedBox(
                      width: double.infinity, child: Center(child: Text("提交"))),
                )
              ],
            ),
          ),
        ));
  }

  Widget _radioCard({
    required String title,
    required String subTitle,
    required String radio1,
    required String radio2,
    required int group,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          //圆角半径
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          // 阴影的颜色，模糊半径
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)]),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "* ",
                          style: TextStyle(color: Colors.red, fontSize: 18)),
                      TextSpan(
                          text: title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent)),
                      TextSpan(
                        text: subTitle,
                      )
                    ])),
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              Obx(() {
                return Radio(
                  value: 0,
                  groupValue: group == 1
                      ? controller.groupValue1.value
                      : group == 2
                          ? controller.groupValue2.value
                          : controller.groupValue3.value,
                  onChanged: (v) {
                    print(v);
                    switch (group) {
                      case 1:
                        controller.peerHealthy.value = true;
                        controller.groupValue1.value = v!;
                        break;
                      case 2:
                        controller.riskRegion.value = false;
                        controller.groupValue2.value = v!;
                        break;
                      case 3:
                        controller.sicken.value = false;
                        controller.groupValue3.value = v!;
                        break;
                    }
                  },
                );
              }),
              Text(radio1),
            ],
          ),
          Row(
            children: [
              Obx(() {
                return Radio(
                  value: 1,
                  groupValue: group == 1
                      ? controller.groupValue1.value
                      : group == 2
                          ? controller.groupValue2.value
                          : controller.groupValue3.value,
                  onChanged: (v) {
                    print(v);

                    switch (group) {
                      case 1:
                        controller.peerHealthy.value = false;
                        controller.groupValue1.value = v!;
                        break;
                      case 2:
                        controller.riskRegion.value = true;
                        controller.groupValue2.value = v!;
                        break;
                      case 3:
                        controller.sicken.value = true;
                        controller.groupValue3.value = v!;
                        break;
                    }
                  },
                );
              }),
              Text(radio2),
            ],
          ),
        ],
      ),
    );
  }
}

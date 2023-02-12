// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/mine_controller.dart';

import '../controllers/health_report_allstu_controller.dart';

class HealthReportAllstuView extends GetView {
  const HealthReportAllstuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(HealthReportAllstuController());
    final controller1 = Get.put(MineController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('查询个人填报记录'),
          centerTitle: true,
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 填报时间',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                "${controller.reportTime}",
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 学生姓名',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40.h,
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                //设置边框

                                border:
                                    Border.all(color: Colors.grey, width: 0.1),

                                //背景颜色

                                color: Colors.deepPurple[50],

                                //设置圆角

                                borderRadius: BorderRadius.circular((5.0)),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0,
                                        right: 4.0,
                                        top: 3.0,
                                        bottom: 3.0),
                                    child: Row(
                                      children: [
                                        Obx(
                                          () => CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  controller1.photo.value)

                                              // child: Image.network(

                                              //     'https://soft2176-use.oss-cn-hangzhou.aliyuncs.com/%E5%A4%B4%E5%83%8F/head-u-1.jpg'),

                                              ),
                                        ),
                                        Obx(
                                          () => Text(
                                            controller1.name.value,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 是否健康',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isHealthy.value == "1"
                                    ? '健康'
                                    : '不健康',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 定位信息',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.position.value +
                                    controller.address.value,
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 是否在校',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isInSchool.value == "1" ? '是' : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 48小时内是否做过核酸',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isTest48.value == "1" ? '是' : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 是否接种疫苗',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isAccinated.value == "1" ? '是' : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 是否有10大症状',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isSymptom10.value == "1" ? '是' : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 是否疑似得过大病',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isSuspectedCovid19.value == "1"
                                    ? '是'
                                    : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 是否确诊',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isQuarantine.value == "1"
                                    ? '否'
                                    : '是',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 是否无症状感染者',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isAsymptomaticInfection.value == "1"
                                    ? '是'
                                    : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 本人及家属有无被隔离人员',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isQuarantine.value == "1"
                                    ? '是'
                                    : '无',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 近期是否途径中高风险地区',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isTransitHignrisk.value == "1"
                                    ? '是'
                                    : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 是否停留中高风险地区',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isStayHignrisk.value == "1"
                                    ? '是'
                                    : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 近期是否接触或途径中高风险地区人员',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isContactHighriskPersonnel.value ==
                                        "1"
                                    ? '是'
                                    : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 近期是否本人访问境外',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isGoAbroad.value == "1" ? '是' : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 近期是否本人访问境外',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isGoAbroad.value == "1" ? '是' : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 近期是否本人访问境外',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isGoAbroad.value == "1" ? '是' : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 近期是否本人访问境外',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isGoAbroad.value == "1" ? '是' : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 近期是否本人访问境外',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isGoAbroad.value == "1" ? '是' : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 近期本人是否接触过境外返回人员',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isContactOverseasPersonnel.value ==
                                        "1"
                                    ? '是'
                                    : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 今天是否有过接触发热或者呼吸道感染症状的人员',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isContactSickPeople.value == "1"
                                    ? '是'
                                    : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 近期是否本人访问境外',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isGoAbroad.value == "1" ? '是' : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 辅导员、班主任是否告知你相关事项',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isInformedByTeacher.value == "1"
                                    ? '是'
                                    : '否',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              ' 你是否怼填写的内容真实性负责',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              //设置边框

                              border:
                                  Border.all(color: Colors.grey, width: 0.1),

                              //设置圆角

                              borderRadius: BorderRadius.circular(5),

                              //设置背景颜色

                              color: Colors.blueGrey[100],
                            ),
                            width: double.infinity,
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Obx(
                              () => Text(
                                // controller.isHealthy.value == 1 ? '不健康' : '健康',
                                controller.isResponsibleForAuthenticity.value ==
                                        "1"
                                    ? '否'
                                    : '是',
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/location_view.dart';

import '../controllers/health_report_controller.dart';

class HealthReport extends StatefulWidget {
  const HealthReport({Key? key}) : super(key: key);

  @override
  State<HealthReport> createState() => _HealthReportState();
}

class _HealthReportState extends State<HealthReport> {
  get groupValue => null;

  bool _checkboxSelected = true;
  //维护复选框状态
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HealthReportController controller = Get.put(HealthReportController());

    return Scaffold(
      appBar: AppBar(
        //设置顶部导航栏（中间）
        title: const Text('健康上报'),
        centerTitle: false,
        //右侧图标
        actions: const [Icon(Icons.more_vert_outlined)],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text('仅添加数据'),
                  color: Colors.grey[200],
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: size.height * 0.7,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical, //滚动方向

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.network(
                                      'https://soft2176-use.oss-cn-hangzhou.aliyuncs.com/web%E8%83%8C%E6%99%AF/bg-35.jpg'),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: const [
                                            Text(
                                              '1、每天',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              '12:00',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 24),
                                            ),
                                            Text('前填报个人健康情况;',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: const [
                                            Text('2、数据填报有问题，',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                            Text(
                                              '点我',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.lightBlue,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                            Text('提交反馈;',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: const [
                                            Text('3、个人已提交信息，',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                            Text(
                                              '点我',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.lightBlue,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                            SizedBox(
                                              child: Text('进入查询;',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width,
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text('4、生源地信息错误，点我进行修改申请',
                                            style: TextStyle(
                                              fontSize: 20,
                                            )),
                                      ),
                                      Container(
                                        width: size.width,
                                        padding: const EdgeInsets.all(15.0),
                                        child:
                                            const Text('5、数据 ，填报错误联系班主任删除数据后重填',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                      ),
                                      Container(
                                        width: size.width,
                                        padding: const EdgeInsets.all(15.0),
                                        child: SizedBox(
                                          child: Row(
                                            children: const [
                                              Text('6、',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  )),
                                              Text(
                                                '祝各位及家人身体健康！',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ],
                                          ),
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

                                      border: Border.all(
                                          color: Colors.grey, width: 0.1),

                                      //设置圆角

                                      borderRadius: BorderRadius.circular(5),

                                      //设置背景颜色

                                      color: Colors.blueGrey[100],
                                    ),
                                    width: double.infinity,
                                    height: 40.h,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      '2022-11-11 13:52:53',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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

                                    border: Border.all(
                                        color: Colors.grey, width: 0.1),

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
                                            const CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    'https://soft2176-use.oss-cn-hangzhou.aliyuncs.com/%E5%A4%B4%E5%83%8F/head-u-1.jpg')

                                                // child: Image.network(

                                                //     'https://soft2176-use.oss-cn-hangzhou.aliyuncs.com/%E5%A4%B4%E5%83%8F/head-u-1.jpg'),

                                                ),
                                            const Text(
                                              'EthanJiao',
                                              style: TextStyle(fontSize: 14),
                                            ),
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
                                    ' 学号（账号）',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //设置边框

                                  border: Border.all(
                                      color: Colors.grey, width: 0.1),

                                  //设置圆角

                                  borderRadius: BorderRadius.circular(5),

                                  //设置背景颜色

                                  color: Colors.blueGrey[100],
                                ),
                                width: double.infinity,
                                height: 40.h,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  '210501100632',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
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
                                    ' 所属学院',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //设置边框

                                  border: Border.all(
                                      color: Colors.grey, width: 0.1),

                                  //设置圆角

                                  borderRadius: BorderRadius.circular(5),

                                  //设置背景颜色

                                  color: Colors.blueGrey[100],
                                ),
                                width: double.infinity,
                                height: 40.h,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  '29.计算机与软件学院',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
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
                                    ' 所在班级',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //设置边框

                                  border: Border.all(
                                      color: Colors.grey, width: 0.1),

                                  //设置圆角

                                  borderRadius: BorderRadius.circular(5),

                                  //设置背景颜色

                                  color: Colors.blueGrey[100],
                                ),
                                width: double.infinity,
                                height: 40.h,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  '软件2176',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
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
                                    ' 所在校区',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //设置边框

                                  border: Border.all(
                                      color: Colors.grey, width: 0.1),

                                  //设置圆角

                                  borderRadius: BorderRadius.circular(5),

                                  //设置背景颜色

                                  color: Colors.blueGrey[100],
                                ),
                                width: double.infinity,
                                height: 40.h,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  '仙林校区',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
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
                                    ' 今天是否在校',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Text('在校'),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Text('不在校'),
                                    ],
                                  ),
                                ],
                              ),
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
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Text('是'),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Text('否'),
                                    ],
                                  ),
                                ],
                              ),
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
                                    ' 当前定位',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    //设置边框

                                    border: Border.all(
                                        color: Colors.grey, width: 0.1),

                                    //设置圆角

                                    borderRadius: BorderRadius.circular(5),

                                    //设置背景颜色

                                    color: Colors.blueGrey[100],
                                  ),
                                  width: double.infinity,
                                  height: 40.h,
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: () => Get.to(LocationView()),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.location_on_outlined),
                                          Text('选择定位')
                                        ]),
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
                                    ' 档案生源地信息',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //设置边框

                                  border: Border.all(
                                      color: Colors.grey, width: 0.1),

                                  //设置圆角

                                  borderRadius: BorderRadius.circular(5),

                                  //设置背景颜色

                                  color: Colors.blueGrey[100],
                                ),
                                width: double.infinity,
                                height: 40.h,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  '请选择',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
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
                                    ' 家庭实际居住地址',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //设置边框

                                  border: Border.all(
                                      color: Colors.grey, width: 0.1),

                                  //设置圆角

                                  borderRadius: BorderRadius.circular(5),

                                  //设置背景颜色

                                  color: Colors.blueGrey[100],
                                ),
                                width: double.infinity,
                                height: 40.h,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  '江苏省南京市羊山北路1号',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
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
                                    ' 是否接种新冠疫苗',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Text('是，已接种')
                                    ],
                                  ),
                                ],
                              )),
                              Container(
                                  child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Text('是，未完成')
                                    ],
                                  ),
                                ],
                              )),
                              Container(
                                  child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Text('否，未接种')
                                    ],
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        ' 是否有‘十大症状’（填报前24小时内）',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '发热、干咳、乏力、鼻塞、流涕、咽痛、嗅觉/味觉减退、结膜炎、肌痛、腹泻等（简称“十大症状”）',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.blue,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '无',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '有',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        ' 本人及家属是否确诊患新型冠状病毒肺炎',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.blue,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '无',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '有',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        ' 本人及家属是否经诊断为无症状感染者',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.blue,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '无',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '有',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Column(
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
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.blue,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '无',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '有',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        ' 近期是否途经中高风险地',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.blue,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '否，未途径',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '是，途径',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        ' 近期是否停留中高风险地区',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.blue,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '否，未停留',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '是，停留',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        ' 期本人有无到访境外情况（含港澳台）',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.blue,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '无',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '有',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        ' 近期本人是否接触过境外返回人员？',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.blue,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '无，无接触史',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '是，有接触史',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        ' 今天是否接触过有发热或呼吸道感染症状的人员？',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.blue,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '否，无接触',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '是，有接触',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Container(
                                        width: size.width * 0.9,
                                        child: Text(
                                          ' 辅导员、班生任是否与你联系并及时告知不要提前返校与瘦情期间的注意事项等信息？',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.blue,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '是，已联系告知',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '否，未联系告知',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Container(
                                        width: size.width * 0.9,
                                        child: Text(
                                          ' 你是否队填写内容的真实性负责？',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.blue,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '是',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        onChanged: (T) => onChange(T),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          //设置边框
                                          border: Border.all(
                                              color: Colors.grey, width: 0.1),
                                          //设置圆角
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //设置背景颜色
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          '否',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                                    ' 其他需要说明的情况',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    //设置边框

                                    border: Border.all(
                                        color: Colors.grey, width: 0.1),

                                    //设置圆角

                                    borderRadius: BorderRadius.circular(5),

                                    //设置背景颜色

                                    // color: Colors.blueGrey[100],
                                  ),
                                  width: double.infinity,
                                  height: 100.h,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 15),
                                  child: TextField(
                                    maxLines: 5,
                                    decoration:
                                        InputDecoration(hintText: "填写内容"),
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
                                    ' 信息正常/异常',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  //设置边框

                                  border: Border.all(
                                      color: Colors.grey, width: 0.1),

                                  //设置圆角

                                  borderRadius: BorderRadius.circular(5),

                                  //设置背景颜色

                                  color: Colors.blueGrey[100],
                                ),
                                width: double.infinity,
                                height: 40.h,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  '正常',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.07,
        child: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _checkboxSelected,
                      activeColor: Colors.blue, //选中时的颜色
                      onChanged: (value) {
                        setState(() {
                          _checkboxSelected = value!;
                        });
                      },
                    ),
                    Text('保存本次提交内容，下次自动填充')
                  ],
                ),
              ),
              // SizedBox(
              //   height: size.height * 0.01,
              // ),
              Container(
                height: size.height * 0.03,
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  //设置边框

                  border: Border.all(color: Colors.grey, width: 0.1),

                  //设置圆角

                  borderRadius: BorderRadius.circular(25),

                  //设置背景颜色

                  color: Colors.blue,
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  '提交',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onChange(Object? t) {}
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/health_report.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/modify_home.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/modify_phone.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/modify_stuplcae.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/problem_feedback.dart';

import '../controllers/health_controller.dart';
import 'health_report_allstu_view.dart';
import 'health_report_prestu_view.dart';

class HealthView extends GetView<HealthController> {
  const HealthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        //设置顶部导航栏（中间）
        title: const Text('健康上报'),
        //标题居中
        centerTitle: true,
        //右侧图标
        actions: [Icon(Icons.more_vert_outlined)],
      ),
      body: Container(
          // child: Row(
          //   children: [
          //     Column(
          //       children: [
          //         GestureDetector(
          //           onTap: () => Get.to(ModifyPhonePage()),
          //           child: Text('修改手机号'),
          //         ),
          //         GestureDetector(
          //           onTap: () => Get.to(ModifyHomePage()),
          //           child: Text('修改家庭地址'),
          //         ),
          //         GestureDetector(
          //           onTap: () => Get.to(ModifyStuPlacePage()),
          //           child: Text('修改生源地'),
          //         ),
          //         GestureDetector(
          //           onTap: () => Get.to(ProblemFeedbackPage()),
          //           child: Text('问题反馈'),
          //         )
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         GestureDetector(
          //           onTap: () => Get.to(ModifyPhonePage()),
          //           child: Text('个人记录'),
          //         ),
          //         GestureDetector(
          //           onTap: () => Get.to(ModifyHomePage()),
          //           child: Text('班级'),
          //         ),
          //         GestureDetector(
          //           onTap: () => Get.to(ModifyStuPlacePage()),
          //           child: Text('学院'),
          //         ),
          //         GestureDetector(
          //           onTap: () => Get.to(ProblemFeedbackPage()),
          //           child: Text('校级'),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
          ),
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                child: Column(
                  children: [Icon(Icons.import_export), Text('健康上报')],
                ),
                onPressed: () => Get.to(HealthReport()),
              ),
            ),
            Expanded(
              child: TextButton(
                child: Column(
                  children: [Icon(Icons.unfold_more), Text('其他操作')],
                ),
                onPressed: () {
                  int a = (_showActions(context)) as int;
                },
              ),
            ),
            Expanded(
              child: TextButton(
                child: Column(
                  children: [Icon(Icons.slideshow_sharp), Text('数据查看')],
                ),
                onPressed: () {
                  int a = (_showData(context)) as int;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreAction extends StatelessWidget {
  const MoreAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: new Icon(Icons.ice_skating),
        onPressed: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const MoreActionItems(),
            // onPop: () => print('Popover was popped!'),
            // direction: PopoverDirection.bottom,
            width: 150.w,
            height: 200.w,
            // arrowHeight: 15,
            // arrowWidth: 30,
          );
        },
      ),
    );
  }
}

class MoreActionItems extends StatelessWidget {
  const MoreActionItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.phone_android_sharp),
                    Text(
                      '修改手机号',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
            ),
            const Divider(),
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.home),
                    Text(
                      '修改生源地',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
            ),
            const Divider(),
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.house_outlined),
                    Text(
                      '修改家庭住址',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
            ),
            const Divider(),
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.report_problem_outlined),
                    Text(
                      '问题反馈',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

Future<int?> _showActions(context) async {
  //使用了一个异步
  var size = MediaQuery.of(context).size; //获取屏幕宽高和Widget大小
  return showModalBottomSheet(
    //showModalBottomSheet函数底部面板相当于一个新的页面
    backgroundColor: Colors.transparent,
    //颜色空白
    isDismissible: true,
    //能否点击消失
    isScrollControlled: true,
    //能否拖动消失
    context: context,
    //接受cotext
    builder: (context) {
      return Container(
        width: size.width,
        height: size.height * 0.7, //使用屏幕宽高比设置大小
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            //圆角
            topLeft: Radius.circular(30), //左上角的圆角
            topRight: Radius.circular(30), //右上角的圆角
          ),
        ),
        child: Column(
          children: [
            Row(
              //如果想要设置一个返回的按钮可以这样写
              children: [
                IconButton(
                  icon: Icon(Icons.chevron_left_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text('其他操作')
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(ModifyPhonePage()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      // color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_android,
                            color: Colors.white,
                          ),
                          Text(
                            '修改手机号',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(ModifyHomePage()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_filled,
                            color: Colors.white,
                          ),
                          Text('修改家庭地址', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(ModifyStuPlacePage()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.houseboat_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            '修改生源地',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(ProblemFeedbackPage()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sync_problem,
                            color: Colors.white,
                          ),
                          Text(
                            '问题反馈',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future<int?> _showData(context) async {
  //使用了一个异步
  var size = MediaQuery.of(context).size; //获取屏幕宽高和Widget大小
  return showModalBottomSheet(
    //showModalBottomSheet函数底部面板相当于一个新的页面
    backgroundColor: Colors.transparent,
    //颜色空白
    isDismissible: true,
    //能否点击消失
    isScrollControlled: true,
    //能否拖动消失
    context: context,
    //接受cotext
    builder: (context) {
      return Container(
        width: size.width,
        height: size.height * 0.7, //使用屏幕宽高比设置大小
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            //圆角
            topLeft: Radius.circular(30), //左上角的圆角
            topRight: Radius.circular(30), //右上角的圆角
          ),
        ),
        child: Column(
          children: [
            Row(
              //如果想要设置一个返回的按钮可以这样写
              children: [
                IconButton(
                  icon: Icon(Icons.chevron_left_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text('数据查看')
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(HealthReportPrestuView()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      // color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          Text(
                            '个人记录',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(HealthReportAllstuView()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.class_rounded,
                            color: Colors.white,
                          ),
                          Text('班级数据', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       GestureDetector(
            //         onTap: () => Get.to(ModifyStuPlacePage()),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: Colors.brown,
            //             borderRadius: BorderRadius.all(Radius.circular(25)),
            //           ),
            //           width: size.width * 0.4,
            //           height: size.width * 0.4,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Icon(
            //                 Icons.school,
            //                 color: Colors.white,
            //               ),
            //               Text(
            //                 '学院记录',
            //                 style: TextStyle(color: Colors.white),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () => Get.to(ProblemFeedbackPage()),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: Colors.blueGrey,
            //             borderRadius: BorderRadius.all(Radius.circular(25)),
            //           ),
            //           width: size.width * 0.4,
            //           height: size.width * 0.4,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Icon(
            //                 Icons.bookmarks_sharp,
            //                 color: Colors.white,
            //               ),
            //               Text(
            //                 '校级记录',
            //                 style: TextStyle(color: Colors.white),
            //               ),
            //             ],
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      );
    },
  );
}

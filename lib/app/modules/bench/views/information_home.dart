import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/information_home_controller.dart';

class InformationHomePage extends StatelessWidget {
  const InformationHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InformationHomeController controller =
        Get.put(InformationHomeController());
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('新闻资讯'),
          centerTitle: true,
          actions: [Icon(Icons.more_vert)],
        ),
        body: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        'https://soft2176-use.oss-cn-hangzhou.aliyuncs.com/%E6%99%BA%E6%85%A7%E5%8D%97%E5%B7%A5/niit_logo.png',
                        width: 300.w,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.search_sharp,
                        size: 40,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 90.w,
                        color: Color.fromRGBO(186, 199, 248, 1),
                        child: Text(
                          '新闻资讯',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 90.w,
                        color: Color.fromRGBO(186, 199, 248, 1),
                        child: Text(
                          '新闻资讯',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 90.w,
                        color: Color.fromRGBO(186, 199, 248, 1),
                        child: Text(
                          '智慧校园',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 90.w,
                        color: Color.fromRGBO(186, 199, 248, 1),
                        child: Text(
                          '南工资讯',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 90.w,
                        color: const Color.fromRGBO(186, 199, 248, 1),
                        child: Text(
                          '南工资讯',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: 550.h,
                    // child: ListView.builder(
                    //   // scrollDirection: Axis.horizontal,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     // return ListTile(title: Text("$index"));
                    //     return Container(
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(10.0),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             const Padding(
                    //               padding: EdgeInsets.only(bottom: 5),
                    //               child: Text(
                    //                 '我校召开“互联网+”创新创业大赛第八届总结会暨第九届启动会',
                    //                 style: TextStyle(
                    //                     fontSize: 18,
                    //                     fontWeight: FontWeight.w700),
                    //               ),
                    //             ),
                    //             Row(
                    //               mainAxisAlignment:
                    //                   MainAxisAlignment.spaceBetween,
                    //               children: const [
                    //                 Text('发布人: 张三'),
                    //                 Text('发布日期: 2022-12-08 20:19:49'),
                    //               ],
                    //             ),
                    //             const Divider(
                    //               height: 1,
                    //               color: Colors.grey,
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                    child: SingleChildScrollView(
                      // scrollDirection: Axis.horizontal,
                      // return ListTile(title: Text("$index"));

                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                '我校召开“互联网+”创新创业大赛第八届总结会暨第九届启动会',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('发布人: 张三'),
                                Text('发布日期: 2022-12-08 20:19:49'),
                              ],
                            ),
                            const Divider(
                              height: 1,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

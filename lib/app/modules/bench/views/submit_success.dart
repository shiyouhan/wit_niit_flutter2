import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SubmitSuccessPage extends StatelessWidget {
  const SubmitSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('提交成功'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            MaterialButton(
              minWidth: 15.w,
              height: 30.h,
              onPressed: () {},
              color: Colors.grey[200],
              child: Text('成功'),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
          ]),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              '提交成功!!!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://soft2176-use.oss-cn-hangzhou.aliyuncs.com/%E6%99%BA%E6%85%A7%E5%8D%97%E5%B7%A5/high-five-69.gif',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '恭喜你!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const Text(
                  '提交成功',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Text(
                      '点击返回',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

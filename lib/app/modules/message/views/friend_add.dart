import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/component/scan_view.dart';

class FriendAdd extends StatelessWidget {
  const FriendAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey,
        title: Text('面对面添加'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(children: [
          //图片，名字
          Container(
            height: 300.h,
            width: 300.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://wx-login.oss-cn-shanghai.aliyuncs.com/upload/%E5%A4%B4%E5%83%8F/%E7%81%B0%E8%89%B2%E5%A4%B4%E5%83%8F.jpg'),
              ),
            ),
            child: Container(
              // padding: EdgeInsets.only(top: 30.h),
              margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '周明伟',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'AI南工',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          //二维码
          Container(
              height: 160.h,
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://wx-login.oss-cn-shanghai.aliyuncs.com/upload/%E5%A4%B4%E5%83%8F/%E4%BA%8C%E7%BB%B4%E7%A0%81.jpg'),
                  ),
                ),
              )),
          //扫描外部联系人二维码
          InkWell(
            onTap: () => Get.to(openScan()),
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 8, 20, 0),
              height: 35.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month_sharp,
                      color: Color(0xff80d1c8),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text('扫描外部联系人二维码'))
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

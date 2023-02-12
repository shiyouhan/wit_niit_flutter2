import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/message/controllers/message_detail_controller.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/meaage_detail.dart';


class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Row(children: [
              Image.network(
                  'https://bearcad.oss-cn-shanghai.aliyuncs.com/Share/share00.png',
                  width: 60.w),
              SizedBox(width: 10.w),
              Text("zmw"),
              SizedBox(width: 5.w),
              Icon(Icons.account_box, color: Colors.blue)
            ]),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('查看日程', style: TextStyle(fontSize: 16.sp)),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              title: Text(
                '设置备注和描述',
                style: TextStyle(fontSize: 18.sp),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.r, top: 10.r),
              child: Row(
                children: [
                  Text('手机', style: TextStyle(fontSize: 18.sp)),
                  SizedBox(width: 40.w),
                  Text(
                    '点击查看',
                    style: TextStyle(fontSize: 18.sp, color: Colors.blue),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.r, top: 15.r),
              child: Row(
                children: [
                  Text('邮箱', style: TextStyle(fontSize: 18.sp)),
                  SizedBox(width: 40.w),
                  Text(
                    'bear@gmail.com',
                    style: TextStyle(fontSize: 18.sp, color: Colors.blue),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.r, top: 15.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('部门', style: TextStyle(fontSize: 18.sp)),
                  SizedBox(width: 40.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('软件2126', style: TextStyle(fontSize: 18.sp)),
                        Text(
                          '南京工业职业技术大学/b.在校学生/01.本科生/29.计算机与软件学院',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20.r),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextButton(
                  onPressed: () {
                  }, child: Text('发消息')),
            ),
            SizedBox(height: 10.h),
            TextButton(
              onPressed: () {},
              child: Text(
                '语音通话',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:wit_niit/app/modules/message/views/add_friend_view.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/add_friend_view.dart';

class MyClientPage extends StatelessWidget {
  const MyClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Container(child: Text('外部联系人')),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wechat,
                  color: Colors.grey,
                  size: 12.sp,
                ),
                Text(
                  '支持加微信',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                )
              ],
            )
          ],
        ),
        centerTitle: true,
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 10),
            child: TextButton(
              child: Text(
                '添加',
                style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddFriendView()));
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 300.h),
          Center(
            child: Column(
              children: [
                Text(
                  '你可以添加客户和合作伙伴的微信,',
                  style: TextStyle(fontSize: 20.sp, color: Colors.grey),
                ),
                Text(
                  '用企业微信与他们聊工作',
                  style: TextStyle(fontSize: 20.sp, color: Colors.grey),
                )
              ],
            ),
          ),
          SizedBox(height: 200.h),
          TextButton(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 50.h,
                width: 200.w,
                color: Colors.blue,
                child: Center(
                    child: Text(
                  '去添加',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                )),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddFriendView()));
            },
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wit_niit_flutter2/app/component/Iconfont.dart';
import 'package:wit_niit_flutter2/app/data/base_data.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/visiting_card.dart';

class groupChat extends StatefulWidget {
  const groupChat({Key? key}) : super(key: key);

  @override
  State<groupChat> createState() => _groupChatState();
}

class _groupChatState extends State<groupChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseData.bodyColor,
      appBar: AppBar(
        title: Text('添加外部联系人'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Get.to(VisitingCard());
              },
              child: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Container(
                    child: Icon(
                        cIcons.icon_erweima
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('面对面添加好友',style: BaseStyle.fs16,),
                      Text('添加身边的好友',style: BaseStyle.fs14G,),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 16,),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Container(
                  child: Icon(
                      Icons.search
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('搜索手机号添加',style: BaseStyle.fs16,),
                    Text('搜索朋友手机号添加',style: BaseStyle.fs14G,),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 16,),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Container(
                  child: Icon(
                      cIcons.icon_weixin
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('从微信好友中添加',style: BaseStyle.fs16,),
                    Text('用企业微信添加微信朋友',style: BaseStyle.fs14G,),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 16,),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Container(
                  child: Icon(
                      cIcons.icon_card
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('将名片分享到微信',style: BaseStyle.fs16,),
                    Text('邀请微信朋友添加',style: BaseStyle.fs14G,),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 16,),
              ),
            )
          ],
        ),
      )
    );
  }
}

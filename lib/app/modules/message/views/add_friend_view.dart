import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/cardshare_wx.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/component/list_item.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/friend_add.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/mobile_add.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/wxfriend_add.dart';

class AddFriendView extends StatelessWidget {
  const AddFriendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('添加外部联系人'),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                InkWell(
                  onTap: () => Get.to(FriendAdd()),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListItem(Icons.account_balance, '面对面添加', '添加身边的朋友')
                      // child: Icon(
                      //   // cIcons.icon_jiahao,
                      //   Icons.account_balance,
                      //   color: Color(0xff80d1c8),
                      // ),
                      ),
                ),
                InkWell(
                  onTap: () => Get.to(MobileAdd()),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListItem(Icons.search, '搜索手机号添加', '搜索朋友手机号添加')
                      // child: Icon(
                      //   // cIcons.icon_jiahao,
                      //   Icons.account_balance,
                      //   color: Color(0xff80d1c8),
                      // ),
                      ),
                ),
                InkWell(
                  onTap: () => Get.to(WxFriendAdd()),
                  child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.white,

                          ),
                      child: ListItem(Icons.add, '从微信好友中添加', '用企业微信添加微信朋友')
                      // child: Icon(
                      //   // cIcons.icon_jiahao,
                      //   Icons.account_balance,
                      //   color: Color(0xff80d1c8),
                      // ),
                      ),
                ),
              ],
            ),
          ),
          Container(
            height: 100.h,
            child: InkWell(
              onTap: () => Get.to(CardShareWx()),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.all(20),
                  child: ListItem(Icons.share, '将名片分享到微信', '邀请微信朋友添加')
                  // child: Icon(
                  //   // cIcons.icon_jiahao,
                  //   Icons.account_balance,
                  //   color: Color(0xff80d1c8),
                  // ),
                  ),
            ),
          )
        ]),
      ),
    );
  }
}

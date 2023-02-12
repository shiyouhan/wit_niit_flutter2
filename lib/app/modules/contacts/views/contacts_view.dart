import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/add_friend_view.dart';

// import 'package:wit_niit/app/modules/message/views/add_friend_view.dart';

import '../controllers/contacts_controller.dart';
import 'Pages/faculty_staff_page.dart';
import 'Pages/group_chat_page.dart';
import 'Pages/my_client_page.dart';
import 'Pages/school_student_page.dart';
import 'Pages/search_page.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('南京工业职业技术大学'),
        centerTitle: true,
        leading: GestureDetector(
          // onTap: () {
          //   controller.getType();
          // },
          child: Icon(Icons.add_card),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 60.h,
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(14.r, 10.r, 14.r, 0.r),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0.r),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Text(
                        '搜索',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
              // 点击搜索
              onTap: () => Get.to(SearchPage()),
            ),
          ),
          SizedBox(height: 10.h),
          ListTile(
            title: Text("群聊"),
            leading: Image(
                image: AssetImage('assets/images/group.png'), width: 50.w),
            onTap: () => Get.to(GroupChatPage()),
          ),
          SizedBox(height: 6.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.r),
            alignment: Alignment.topLeft,
            child: Text("我的客户"),
          ),
          SizedBox(height: 6.h),
          ListTile(
            title: Text("我的客户"),
            leading: Image(
                image: AssetImage('assets/images/wechat1.png'), width: 50.w),
            onTap: () => Get.to(MyClientPage()),
          ),
          SizedBox(height: 10.h),
          ListTile(
            title: Text("添加客户"),
            leading: Image(
                image: AssetImage('assets/images/add_user.png'), width: 50.w),
            onTap: () => Get.to(AddFriendView()),
          ),
          SizedBox(height: 6.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.r),
            alignment: Alignment.topLeft,
            child: Text("AI南工"),
          ),
          SizedBox(height: 6.h),
          ListTile(
            title: Text("a.教职员工"),
            leading: Icon(Icons.folder, size: 28.sp, color: Colors.blue),
            onTap: () => Get.to(FacultyStaffPage()),
          ),
          ListTile(
            title: Text("b.在校学生"),
            leading: Icon(Icons.folder, size: 28.sp, color: Colors.blue),
            onTap: () => Get.to(SchoolStudentPage()),
          ),
          ListTile(
            title: Text("l.临时员工"),
            leading: Icon(Icons.folder, size: 28.sp, color: Colors.blue),
            // onTap: () => Get.to(TemporaryPage()),
          ),
          Text(
            '共16950人',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          )
        ],
      ),
    );
  }
}

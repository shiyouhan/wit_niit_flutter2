import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'search_page.dart';
import 'undergraduate_page.dart';
import 'junior_students.dart';

class SchoolStudentPage extends StatelessWidget {
  const SchoolStudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('b.在校学生'),
      ),
      body: Column(
        children: [
          SearchBar(),
          ListTile(
            leading: Icon(Icons.folder, size: 28.sp, color: Colors.blue),
            title: Text('01.本科生'),
            onTap: () => Get.to(UndergraduatePage()),
          ),
          ListTile(
            leading: Icon(Icons.folder, size: 28.sp, color: Colors.blue),
            title: Text('02.专科生'),
            onTap: () => Get.to(JuniorStudentsPage(title: '02.专科生',)),
          ),
          Center(
            child: Text(
              '共16254人',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

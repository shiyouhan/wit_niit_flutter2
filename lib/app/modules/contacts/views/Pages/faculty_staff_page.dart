import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../list/faculty_group_list.dart';

class FacultyStaffPage extends StatelessWidget {
  const FacultyStaffPage({Key? key}) : super(key: key);

  List<Widget> _facultyList() {

    var tempList = facultyGroupList.map((value) {
      return ListTile(
        leading: Icon(Icons.folder, size: 28.sp, color: Colors.blue),
        title: Text("${value["title"]}"),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('a.教职员工'),
        centerTitle: true,
      ),
      body: ListView(
        children: _facultyList(),
      ),
    );
  }
}

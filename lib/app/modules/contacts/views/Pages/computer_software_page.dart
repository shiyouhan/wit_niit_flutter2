import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'grade_page.dart';
import 'personal_information_page.dart';
import 'search_page.dart';

class ComputerSoftwarePage extends StatelessWidget {
  const ComputerSoftwarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('29.计算机与软件学院'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchBar(),
          ListTile(
            leading: Image(
              image: NetworkImage(
                  "https://bearcad.oss-cn-shanghai.aliyuncs.com/Share/share00.png"),
              width: 50.w,
            ),
            title: Text('zmw'),
            onTap: () => Get.to(PersonalInformationPage()),
          ),
          ListTile(
            leading: Icon(Icons.folder, size: 28.sp, color: Colors.blue),
            title: Text('2021'),
            onTap: () => Get.to(GradePage()),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'search_page.dart';
import 'software_page.dart';

class GradePage extends StatelessWidget {
  const GradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2021'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchBar(),
          ListTile(
            leading: Icon(Icons.folder, size: 28.sp, color: Colors.blue),
            title: Text('软件2176'),
            onTap: () => Get.to(SoftwarePage()),
          ),
        ],
      ),
    );
  }
}

// List<Map> classList = [
//   {"title": '软件2126',"route": 'Demo()'},
//   {"title": '软件2176'},
// ];

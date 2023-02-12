import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'computer_software_page.dart';
import 'search_page.dart';

class UndergraduatePage extends StatelessWidget {
  const UndergraduatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('01.本科生'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchBar(),
          ListTile(
            title: Text('29.计算机与软件学院'),
            leading: Icon(Icons.folder, size: 28.sp, color: Colors.blue),
            onTap: () => Get.to(ComputerSoftwarePage()),
          ),
        ],
      ),
    );
  }
}

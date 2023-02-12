import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'computer_software_page.dart';
import 'search_page.dart';

class JuniorStudentsPage extends StatefulWidget {
  final String title;
  const JuniorStudentsPage({super.key,this.title=""});

  @override
  State<JuniorStudentsPage> createState() => _JuniorStudentsPageState();
}

class _JuniorStudentsPageState extends State<JuniorStudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
        body: Column(
        children: [
          SearchBar(),
          ListTile(
            title: Text('计算机与软件学院'),
            leading: Icon(Icons.folder, size: 28.sp, color: Colors.blue),
            onTap: () => Get.to(ComputerSoftwarePage()),
          ),
        ],
      ),
    );
  }
}


// class JuniorStudentsPage extends StatelessWidget {
//   const JuniorStudentsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('02.专科生'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           SearchBar(),
//           ListTile(
//             title: Text('计算机与软件学院'),
//             leading: Icon(Icons.folder, size: 28.sp, color: Colors.blue),
//             onTap: () => Get.to(ComputerSoftwarePage()),
//           ),
//         ],
//       ),
//     );
//   }
// }

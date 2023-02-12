import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoftwarePage extends StatelessWidget {
  const SoftwarePage({Key? key}) : super(key: key);

  List<Widget> _studentList() {
    var tempList = studentList.map((value) {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListTile(
          leading: Image.network("${value["imageUrl"]}",
              width: 50.sp, fit: BoxFit.cover),
          title: Text("${value["title"]}"),
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('软件2176'),
        centerTitle: true,
      ),
      body: ListView(
        children: _studentList(),
      ),
    );
  }
}

List<Map> studentList = [
  {
    "title": '施友涵',
    "imageUrl": 'https://bearcad.oss-cn-shanghai.aliyuncs.com/Share/share07.png'
  },
  {
    "title": '周明伟',
    "imageUrl": 'https://bearcad.oss-cn-shanghai.aliyuncs.com/Share/share03.jpg'
  },
  {
    "title": '李洪涛',
    "imageUrl": 'https://bearcad.oss-cn-shanghai.aliyuncs.com/Share/share04.jpg'
  },
  {
    "title": '王潇',
    "imageUrl": 'https://bearcad.oss-cn-shanghai.aliyuncs.com/Share/share05.jpg'
  },
  {
    "title": '金帅',
    "imageUrl": 'https://bearcad.oss-cn-shanghai.aliyuncs.com/Share/share01.jpg'
  },
  {
    "title": '张珂',
    "imageUrl": 'https://bearcad.oss-cn-shanghai.aliyuncs.com/Share/share06.jpg'
  },
];

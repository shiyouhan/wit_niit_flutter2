import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModifyHomePage extends StatelessWidget {
  const ModifyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '[申请]学生修改家庭住址信息申请表',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            MaterialButton(
              minWidth: 15.w,
              height: 30.h,
              onPressed: () {},
              color: Colors.grey[200],
              child: Text('发起流程'),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
          ]),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: const <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: "学生姓名",
                        hintText: "请输入学生姓名",
                        prefixIcon: Icon(Icons.drive_file_rename_outline)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "所在班级",
                        hintText: "请输入班级号",
                        prefixIcon: Icon(Icons.class_)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "所属学院",
                        hintText: "请输入所属学院",
                        prefixIcon: Icon(Icons.school)),
                  ),
                  TextField(
                    // autofocus: true,
                    decoration: InputDecoration(
                        labelText: "10位学号",
                        hintText: "请输入10位学号",
                        prefixIcon: Icon(Icons.numbers)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "班主任",
                        hintText: "请输入班主任姓名",
                        prefixIcon: Icon(Icons.person)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "家庭地址",
                        hintText: "请输入家庭地址",
                        prefixIcon: Icon(Icons.local_fire_department_rounded)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "拟申请修改地址",
                        hintText: "请输入拟申请修改地址",
                        prefixIcon: Icon(Icons.local_activity)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "申请原因",
                        hintText: "请填写申请原因",
                        prefixIcon: Icon(Icons.mark_email_read)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "申请时间",
                        hintText: "请输入申请时间",
                        prefixIcon: Icon(Icons.timelapse)),
                  ),
                ],
              )),
        ],
      ),
      bottomNavigationBar: Container(
        width: 100.w,
        height: 40.h,
        // 底部导航
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: Icon(Icons.save),
                label: Text("保存草稿"),
                onPressed: () {},
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('提交'),
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(0, 118, 246, 0.8)), //按钮背景颜色
                    side: MaterialStateProperty.all(const BorderSide(
                        width: 1, color: Color(0xffffffff))), //边框
                    shape: MaterialStateProperty.all(const StadiumBorder(
                        side: BorderSide(
                      //设置界面效果
                      style: BorderStyle.solid,
                    )))), //圆角弧度
              ),
            ],
          ),
        ),
      ),
    );
  }
}

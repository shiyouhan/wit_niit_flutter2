import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProblemFeedbackPage extends StatelessWidget {
  const ProblemFeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // scaffold添加属性  解决键盘弹出报错导致的问题，关闭功能： scaffold重新计算高度
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          '[反馈]系统使用问题反馈',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: Column(
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
                children: <Widget>[
                  TextField(
                    // autofocus: true,
                    decoration: InputDecoration(
                        labelText: "10位学号",
                        hintText: "请输入10位学号",
                        prefixIcon: Icon(Icons.person)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "学生姓名",
                        hintText: "请输入学生姓名",
                        prefixIcon: Icon(Icons.drive_file_rename_outline)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "手机号码",
                        hintText: "请输入手机号码",
                        prefixIcon: Icon(Icons.class_)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "问题描述",
                        hintText: "请输入问题描述",
                        prefixIcon: Icon(Icons.report_problem_outlined)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.picture_in_picture_alt_outlined,
                              color: Colors.grey[600],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                '问题界面截图',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 40),
                        child: Icon(
                          Icons.add_box_outlined,
                          size: 80,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "申请时间",
                        hintText: "请选择申请时间",
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

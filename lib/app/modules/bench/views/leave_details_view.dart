import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_details_controller.dart';

class LeaveDetailsView extends GetView<LeaveDetailsController> {
  const LeaveDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LeaveController leaveController = Get.put(LeaveController());
    return Scaffold(
      appBar: AppBar(
        title: Text('请假详情页'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0,right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(
                color: Colors.grey,
              ),
              if (leaveController.leaveStatus.value)
                Row(
                  children: <Widget>[
                    Icon(Icons.circle, color: Colors.green),
                    SizedBox(
                      width: 10,
                    ),
                    Text("已销假"),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              Text(
                "基础信息",
                style: BaseStyle.fs26b,
              ),
              Divider(
                color: Colors.grey,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: tileList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(tileList[index])),
                          Expanded(flex: 2, child: Text("待接收数据"))
                        ],
                      ),
                    );
                  }),
              Divider(
                color: Colors.grey,
              ),
              Text(
                "审核流程",
                style: BaseStyle.testFontBold,
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5, right: 10),
                    child: Text(
                      "2020-11-22 23:20",
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _childsWidget(),
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                onPressed: () {},
                child: SizedBox(
                  width: double.infinity,
                    child: Center(child: Text("打印"))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _line() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        height: (200 - 5) / 3,
        width: 2,
        color: Colors.grey,
      ),
    );
  }

  Widget _circle(text) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: true ? Colors.green : Colors.black38,
          size: 30,
        ),
        Text(text)
      ],
    );
  }

  List<Widget> _childsWidget() {
    // if (widget.flowStyle == FlowWidthStyle.all) {
    return [_circle("提交申请"), _line(), _circle("结束")];
    // } else if (widget.flowStyle == FlowWidthStyle.top) {
    //   return [Padding(padding: EdgeInsets.only(top: (defaultHeight - circleWidth) / 2), child: _circle()), _line()];
    // } else {
    //   return [_line(), _circle()];
    // }
  }
}

List tileList = [
  "学号",
  "姓名",
  "性别",
  "电话",
  "学院",
  "班级",
  "现在年纪",
  "班主任姓名",
  "班主任电话",
  "住宿地址",
  "请假类型",
  "请假日期",
  "请假天数",
  "证明材料",
  "手机号",
  "是否占用上课时间",
  "是否出校",
  "出校去向",
  "出校具体地址",
  "拟返校时间",
  "申请时间",
];

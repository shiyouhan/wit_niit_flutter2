import 'package:flutter/material.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';

class EntranceHistory extends StatelessWidget {
  const EntranceHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('历史记录'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(color: Colors.white,
                // 阴影的颜色，模糊半径
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 6)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Color(0xFFd2f1fe),
                          border: Border.all(color: Colors.blue)),
                      child: Text(
                        "进行中",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "学生",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "起止时间：2022-11-06-2023-01-31",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "待处理()",
                    style: BaseStyle.testFont,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "已批准()",
                    style: BaseStyle.testFont,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "已驳回()",
                    style: BaseStyle.testFont,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "已失效()",
                    style: BaseStyle.testFont,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                        minimumSize: MaterialStateProperty.all(Size(90, 35)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent)),
                    onPressed: () {},
                    child: Text(
                      "全部",
                      style: BaseStyle.fs20W,
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                        minimumSize: MaterialStateProperty.all(Size(90, 35)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent)),
                    onPressed: () {},
                    child: Text(
                      "无风险",
                      style: BaseStyle.fs20W,
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                        minimumSize: MaterialStateProperty.all(Size(90, 35)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent)),
                    onPressed: () {},
                    child: Text(
                      "有风险",
                      style: BaseStyle.fs20W,
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                        minimumSize: MaterialStateProperty.all(Size(90, 35)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent)),
                    onPressed: () {},
                    child: Text(
                      "信息不符",
                      style: BaseStyle.fs20W,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

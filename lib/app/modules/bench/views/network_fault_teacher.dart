import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetworkFaultTeacherPage extends StatelessWidget {
  const NetworkFaultTeacherPage({Key? key}) : super(key: key);
  get groupValue => null;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('[报障]教师网络故障报修'),
        centerTitle: false,
        actions: const [Icon(Icons.more_horiz_outlined)],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 15.w,
                  height: 35.h,
                  onPressed: () {},
                  color: Colors.grey[200],
                  child: Text('发起流程'),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                Container(
                  height: size.height - 240.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical, //滚动方向
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      ' 报障人',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40.h,
                                      margin: EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        //设置边框
                                        border: Border.all(
                                            color: Colors.grey, width: 0.1),
                                        //背景颜色
                                        color: Colors.deepPurple[50],
                                        //设置圆角
                                        borderRadius:
                                            BorderRadius.circular((5.0)),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0,
                                                right: 4.0,
                                                top: 3.0,
                                                bottom: 3.0),
                                            child: Row(
                                              children: [
                                                const CircleAvatar(
                                                    backgroundImage: NetworkImage(
                                                        'https://soft2176-use.oss-cn-hangzhou.aliyuncs.com/%E5%A4%B4%E5%83%8F/head-u-1.jpg')
                                                    // child: Image.network(
                                                    //     'https://soft2176-use.oss-cn-hangzhou.aliyuncs.com/%E5%A4%B4%E5%83%8F/head-u-1.jpg'),
                                                    ),
                                                const Text(
                                                  'EthanJiao',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    //设置边框
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.1),
                                                    //设置背景颜色
                                                    color: Colors.grey,
                                                    //设置圆角
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            (25.0)),
                                                  ),
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white70,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 40.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                        //设置边框
                                        border: Border.all(
                                            color: Colors.grey, width: 0.1),
                                        //背景颜色
                                        // color: Colors.deepPurple[50],
                                        //设置圆角
                                        borderRadius:
                                            BorderRadius.circular((25.0)),
                                      ),
                                      child: IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {}),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      ' 工号（账号）',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    //设置边框
                                    border: Border.all(
                                        color: Colors.grey, width: 0.1),
                                    //设置圆角
                                    borderRadius: BorderRadius.circular(5),
                                    //设置背景颜色
                                    color: Colors.blueGrey[100],
                                  ),
                                  width: double.infinity,
                                  height: 40.h,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    '210501100632',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      ' 所在学院',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    //设置边框
                                    border: Border.all(
                                        color: Colors.grey, width: 0.1),
                                    //设置圆角
                                    borderRadius: BorderRadius.circular(5),
                                    //设置背景颜色
                                    color: Colors.blueGrey[100],
                                  ),
                                  width: double.infinity,
                                  height: 40.h,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    '29.计算机与软件学院',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      ' 性别',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    //设置边框
                                    border: Border.all(
                                        color: Colors.grey, width: 0.1),
                                    //设置圆角
                                    borderRadius: BorderRadius.circular(5),
                                    //设置背景颜色
                                    color: Colors.blueGrey[100],
                                  ),
                                  width: double.infinity,
                                  height: 40.h,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    '男',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      ' 手机长号',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    //设置边框
                                    border: Border.all(
                                        color: Colors.grey, width: 0.1),
                                    //设置圆角
                                    borderRadius: BorderRadius.circular(5),
                                    //设置背景颜色
                                    color: Colors.blueGrey[100],
                                  ),
                                  width: double.infinity,
                                  height: 40.h,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    '18012275669',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      ' 故障类型',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: groupValue,
                                          onChanged: (T) => onChange(T),
                                        ),
                                        Text('账号问题')
                                      ],
                                    ),
                                  ],
                                )),
                                Container(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: groupValue,
                                          onChanged: (T) => onChange(T),
                                        ),
                                        Text('网络问题')
                                      ],
                                    ),
                                  ],
                                )),
                                Container(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: groupValue,
                                          onChanged: (T) => onChange(T),
                                        ),
                                        Text('电脑问题')
                                      ],
                                    ),
                                  ],
                                )),
                                Container(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: groupValue,
                                          onChanged: (T) => onChange(T),
                                        ),
                                        Text('应用问题')
                                      ],
                                    ),
                                  ],
                                )),
                                Container(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: groupValue,
                                          onChanged: (T) => onChange(T),
                                        ),
                                        Text('其他问题')
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      ' 详细说明',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      //设置边框
                                      border: Border.all(
                                          color: Colors.grey, width: 0.1),
                                      //设置圆角
                                      borderRadius: BorderRadius.circular(5),
                                      //设置背景颜色
                                      // color: Colors.blueGrey[100],
                                    ),
                                    width: double.infinity,
                                    height: 100.h,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 15),
                                    child: TextField(
                                      maxLines: 5,
                                      decoration:
                                          InputDecoration(hintText: "填写内容"),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 64.h,
        child: Container(
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [Icon(Icons.unfold_more), Text('更多')],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [Icon(Icons.save_rounded), Text('保存草稿')],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: Text("提交"),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onChange(Object? t) {}
}

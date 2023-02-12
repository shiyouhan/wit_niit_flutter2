import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetworkFaultOthersPage extends StatelessWidget {
  const NetworkFaultOthersPage({Key? key}) : super(key: key);
  get groupValue => null;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('[报障]其他人员网络故障报修'),
        centerTitle: false,
        actions: const [Icon(Icons.more_horiz_outlined)],
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
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
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '*',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Text(
                                    ' 人员类型',
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
                                      Text('半山花园住户')
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
                                      Text('后勤、宿管及其他工作人员')
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
                                      Text('创业园用户/经营和')
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
                                      Text('外聘教师/与学校合作单位人员')
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
                                      Text('其他')
                                    ],
                                  ),
                                ],
                              ))
                            ],
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
                                      ' 姓名',
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
                                    '请填写内容',
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
                                    '请填写内容',
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
                                      ' 上网账号',
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
                                    '请填写内容',
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/component/side_menu.dart';
import 'package:wit_niit_flutter2/app/data/leave_record.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/leave_add_view.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/leave_details_view.dart';

class LeaveView extends GetView<LeaveController> {
  const LeaveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LeaveController controller = Get.put(LeaveController());
    return Scaffold(
      appBar: AppBar(
          title: Text('请假'),
          leading: IconButton(
            icon: Icon(Icons.backspace_outlined),
            onPressed: () {
              Get.back();
              // Get.to(HomeView());
            },
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                // Obx(() => );
                controller.setDisplay();
                print(controller.display);
              },
              icon: Icon(Icons.more_vert),
            ),
          ]),
      body: Stack(children: [
        // Container(
        //   // width: MediaQuery.of(context).size.width,
        //   // height: double.infinity,
        // ),
        SingleChildScrollView(
            child: ListView.separated(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final LeaveController controller = Get.put(LeaveController());
                  return MaterialButton(
                    onPressed: () => Get.to(LeaveDetailsView()),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Text("事假（不离宁）"),
                                // Text("2022-10-13 09:14"),

                                Text(LeaveRecord.fromJson(
                                        controller.data.value[index])
                                    .type!),

                                Text(LeaveRecord.fromJson(
                                        controller.data.value[index])
                                    .applicationTime!)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: index % 2 == 0
                              ? Row(
                                  children: const [
                                    Icon(
                                      Icons.egg_rounded,
                                      color: Colors.grey,
                                    ),
                                    Text("草稿")
                                  ],
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Icons.egg_rounded,
                                      color: Colors.green,
                                    ),
                                    Text("已通过")
                                  ],
                                ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(color: Colors.grey);
                },
                itemCount: controller.data.value.length)),
        Obx(
          () => controller.display.value
              ? Positioned(
                  top: 5,
                  right: 20,
                  child: SideMenu(
                    list: _list,
                    show: controller.display.value,
                    iconColor: Colors.blue,
                    textStyle: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ))
              : Container(),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(LeaveAddView());
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }

// Widget _listCart(BuildContext context, int index) {
//   final LeaveController controller = Get.put(LeaveController());
//   return MaterialButton(
//     onPressed: () => Get.to(LeaveDetailsView()),
//     child: Row(
//       children: [
//         Expanded(
//           flex: 9,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 // Text("事假（不离宁）"),
//                 // Text("2022-10-13 09:14"),
//                 Obx(() {
//                   return Text(
//                       LeaveRecord.fromJson(controller.data.value[index])
//                           .type!);
//                 }),
//                 Obx(() {
//                   return Text(
//                       LeaveRecord.fromJson(controller.data.value[index])
//                           .applicationTime!);
//                 })
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 3,
//           child: index % 2 == 0
//               ? Row(
//                   children: [
//                     Icon(
//                       Icons.egg_rounded,
//                       color: Colors.grey,
//                     ),
//                     Text("草稿")
//                   ],
//                 )
//               : Row(
//                   children: [
//                     Icon(
//                       Icons.egg_rounded,
//                       color: Colors.green,
//                     ),
//                     Text("已通过")
//                   ],
//                 ),
//         )
//       ],
//     ),
//   );
// }
}

List<Menu> _list = [
  Menu(Icons.ac_unit, "转发", function: () {}),
  Menu(Icons.ac_unit_outlined, "分享到微信"),
  Menu(Icons.ac_unit_outlined, "分享到朋友圈"),
  Menu(Icons.ac_unit_outlined, "收藏"),
  Menu(Icons.ac_unit_outlined, "复制链接"),
  Menu(Icons.ac_unit_outlined, "浏览器打开"),
  Menu(Icons.ac_unit_outlined, "调整字体"),
  Menu(Icons.ac_unit_outlined, "刷新"),
  Menu(Icons.ac_unit_outlined, "消息通知"),
  Menu(Icons.ac_unit_outlined, "应用详情"),
];

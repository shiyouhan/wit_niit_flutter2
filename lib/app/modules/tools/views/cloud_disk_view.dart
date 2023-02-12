import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/theme_data.dart';
import 'package:wit_niit_flutter2/app/modules/contacts/views/Pages/search_page.dart';
import 'package:wit_niit_flutter2/app/modules/tools/controllers/micro_disk_controller.dart';
import 'package:wit_niit_flutter2/app/modules/tools/views/micro_disk_view.dart';

class MicroDiskFileView extends GetView<MicroDiskController> {
  const MicroDiskFileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('相册'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SearchPage()));
              },
              icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Config.mainColor,
        selectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 12),
        items: [
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => MicroDiskView());
                  },
                  child: Icon(
                    Icons.source,
                    color: Colors.grey,
                  )),
              label: "文件"),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Get.to(() => MicroDiskFileView());
                  },
                  child: Icon(
                    Icons.picture_as_pdf_sharp,
                    color: Config.mainColor,
                  )),
              label: "相册"),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
            child: Image.network(
              alignment: Alignment.center,
              'https://pixiuosses.oss-cn-shanghai.aliyuncs.com/3.png',
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('暂无共享相册'),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('创建后成员可上传、共享精彩图片'),
          ),
          ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "提示信息!",
                    middleText: "企业管理员已限制成员自行创建相册。如有需要，请向管理员申请",
                    confirm: ElevatedButton(
                        onPressed: () {
                          print("申请");
                          Get.back();
                        },
                        child: const Text("申请")),
                    cancel: ElevatedButton(
                        onPressed: () {
                          print("取消");
                          Get.back();
                        },
                        child: const Text("取消")));
              },
              child: const Text("创建相册")),
        ],
      ),
    );
  }
}
// Column(
// children: [
// TextText("创建后成员可上传、共享精彩图片"),("暂无共享相册"),
// Text("创建后成员可上传、共享精彩图片"),
// ],
// ),
// child: Container(
// padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 55),
// child: Image.network(
// 'https://pixiuosses.oss-cn-shanghai.aliyuncs.com/3.png'),
// ),
// padding: const EdgeInsets.all(150),
// child: Text("暂无共享相册 \n创建后成员可上传、共享精彩图片"),
// class CloudDiskView extends GetView {
//   CloudDiskView({Key? key}) : super(key: key);
//   CloudDiskController _controller = Get.put(CloudDiskController());
//
//   @override
//   Widget build(BuildContext context) {
//     //获取Table_folder
//     List<Table_folder> list_table = cloudDataList
//         .asMap()
//         .keys
//         .map((e) => Table_folder(
//       name: cloudDataList[e].name,
//       dateTime: cloudDataList[e].dataTime,
//       bgColor: cloudColor[e % 4],
//     ))
//         .toList();
//     //获取List_folder
//     List<List_folder> list_list = cloudDataList
//         .asMap()
//         .keys
//         .map((e) => List_folder(
//       name: cloudDataList[e].name,
//       dateTime: cloudDataList[e].dataTime,
//       bgColor: cloudColor[e % 4],
//     ))
//         .toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         // leading: IconButton(
//         //   icon: const Icon(Icons.assignment_return_outlined),
//         //   onPressed: () {
//         //     // print("左侧的按钮图标");
//         //   },
//         // ),
//         title: const Text('微盘'),
//         actions: [
//           // IconButton(
//           //   icon: const Icon(Icons.search),
//           //   onPressed: () {
//           //     // print("搜索图标");
//           //   },
//           // ),
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               // print("加号");
//             },
//           ),
//         ],
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
//           child: Column(children: [
//             _search(),
//             _sort(),
//             Container(
//               height: MediaQuery.of(context).size.height - 250,
//               child: Obx(() {
//                 return GridView.count(
//                   crossAxisCount: _controller.table_show.isTrue ? 2 : 1,
//                   childAspectRatio:
//                   _controller.table_show.isTrue ? 165 / 125 : 4.5,
//                   children:
//                   _controller.table_show.isTrue ? list_table : list_list,
//                 );
//               }),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
//
//   /**
//    * 搜索框
//    */
//   Widget _search() {
//     return Container(
//       padding: EdgeInsets.only(left: 10.r),
//       decoration: BoxDecoration(
//           border: Border.all(width: 1.r, color: Colors.black12),
//           borderRadius: BorderRadius.all(Radius.circular(10.r))),
//       child: TextField(
//         decoration: InputDecoration(
//           // filled: true,
//             border: InputBorder.none,
//             icon: Icon(
//               Icons.search,
//               color: Color(0xf22215b),
//             ),
//             hintText: "搜索文件夹"),
//       ),
//     );
//   }
//
//   /**
//    * 排序
//    */
//   Widget _sort() {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           PopupMenuButton(
//             child: Row(
//               children: [
//                 Obx(() {
//                   return Text(
//                     "${_controller.useSort}",
//                     style: TextStyle(fontSize: 16.sp),
//                   );
//                 }),
//                 SizedBox(
//                   width: 10.w,
//                 ),
//                 Icon(
//                   //大小旁边按扭
//                   Icons.keyboard_arrow_down,
//                   color: Colors.black12,
//                 )
//               ],
//             ),
//             itemBuilder: (_) {
//               return CloudDiskController.sort
//                   .asMap()
//                   .keys
//                   .map((e) => PopupMenuItem(
//                 child: Text(CloudDiskController.sort[e]),
//                 onTap: () {
//                   _controller.useSort.value =
//                   CloudDiskController.sort[e];
//                 },
//               ))
//                   .toList();
//             },
//           ),
//           Container(
//             child: Row(
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       _controller.table_show.value = true;
//                     },
//                     // icon: Icon(Icons.add_box_sharp)
//                     icon: Icon(
//                       Icons.account_balance_wallet_outlined,
//                       color: Colors.green,
//                     )),
//                 IconButton(
//                     onPressed: () {
//                       _controller.table_show.value = false;
//                     },
//                     // icon: Icon(cIcons.icon_jiahao)
//                     icon: Icon(
//                       Icons.account_balance_wallet,
//                       color: Colors.green,
//                     )),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/card_data.dart';
import 'package:wit_niit_flutter2/app/modules/login/views/start_view.dart';
import 'package:wit_niit_flutter2/app/modules/tools/component/card_container.dart';
import 'package:wit_niit_flutter2/app/routes/app_pages.dart';

import '../controllers/tools_controller.dart';

class ToolsView extends GetView<ToolsController> {
  const ToolsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cellWidth = ((MediaQuery.of(context).size.width - 34) / 4);
    double desiredCellHeight = 75;
    double childAspectRatio = cellWidth / desiredCellHeight;
    return Scaffold(
      appBar: AppBar(
        title: const Text('工具箱'),
        centerTitle: true,
        leading: Container(),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: childAspectRatio,
        controller:  ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 5),
        children: CardList.map((CardInfo cardInfo) {
          return  card_container(
            child: Container(
              // height: 20,
              child: cardInfo.icon,
            ),
            content: cardInfo.desc,
            toName: cardInfo.toName,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade200,
        onPressed: () {
          SpUtil.remove('token');
          Get.to(StartView());
        },
        child: Text("退出"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/option_data.dart';

import './option_container.dart';
import '../controllers/bench_controller.dart';

class BenchView extends GetView<BenchController> {
  const BenchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BenchController controller = Get.put(BenchController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('工作台'),
        centerTitle: true,
        leading: Container(),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3.5,
        controller: ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 5),
        children: controller.optionList.map((Option option) {
          return OptionContainer(
            To: option.function,
            content: option.title,
            child: Container(
              height: 20,
              child: Icon(
                option.icon,
                color: Color(0xff80d1c8),
                size: 40,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

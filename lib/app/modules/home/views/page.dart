import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/home/controllers/home_controller.dart';
import 'package:wit_niit_flutter2/generated/l10n.dart';

class page extends GetView<HomeController> {
  const page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var c = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '我的 is working',
              style: TextStyle(fontSize: 20),
            ),
            Text('${controller.username}'),
            Text('${c.count}'),
            Text('国际化显示:${S.current.login}')
          ],
        ),
      ),
    );
  }
}

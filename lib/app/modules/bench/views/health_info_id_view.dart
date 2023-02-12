import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HealthInfoIdView extends GetView {
  const HealthInfoIdView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HealthInfoIdView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HealthInfoIdView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

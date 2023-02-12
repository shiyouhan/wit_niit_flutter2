import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SingleView extends GetView {
  const SingleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SingleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

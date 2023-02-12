import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DiskDetailView extends GetView {
  const DiskDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiskDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DiskDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

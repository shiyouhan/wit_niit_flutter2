import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/CacheUtil.dart';

class SetStorageController extends GetxController {
  //TODO: Implement SetStorageController
  final isSelected = 0.obs;
  var storage = 0.00.obs;
  final file = 0.01.obs;
  final ram = 256.00.obs;

  ValueNotifier<num> cacheSize = ValueNotifier(0.00);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> initCache() async {
    /// 获取缓存大小
    storage = (await CacheUtil.total().obs) as RxDouble;

    /// 复制变量
    cacheSize.value = storage as int ?? 0;
  }

  Future<void> handleClearCache() async {
    try {
      if (cacheSize.value <= 0) throw '没有缓存可清理';

      /// 执行清除缓存
      await CacheUtil.clear();

      /// 更新缓存
      await initCache();
    } catch (e) {
      print(e);
    }
  }

  void clean() => {
        isSelected.value = 1,
        handleClearCache(),
      };
}

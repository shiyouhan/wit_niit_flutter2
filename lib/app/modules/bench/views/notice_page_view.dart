import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notice_page_controller.dart';

class NoticePageView extends GetView {
  const NoticePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NoticePageController controller = Get.put(NoticePageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('通知公告'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    '各位毕业班同学大家好，下半年秋招期间定期会有以【南工就业办】的就业信息短信，根据移动公司的要求，会在短信末尾，加上退订回N，请大家不要回复N，一旦回复将收不到任何就业相关短信。',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // Text('发布人: 张三'),
                    Text('发布日期: 2022-11-23 23:57:54'),
                  ],
                ),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    '根据省教育厅对高校的疫情防控要求，快递服务中心属于重点防疫场所，未规范佩戴口罩者将不得进入。请广大师生主动配合现场工作人员引导，从前门入口处进入快递服务中心，进入后全程规范佩戴口罩，感谢大家对学校疫情防控工作的理解和配合！',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // Text('发布人: 张三'),
                    Text('发布日期: 2022-11-24 00:02:59'),
                  ],
                ),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/component/Iconfont.dart';
import 'package:wit_niit_flutter2/app/data/theme_data.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/bench_view.dart';
import 'package:wit_niit_flutter2/app/modules/contacts/views/contacts_view.dart';
import 'package:wit_niit_flutter2/app/modules/home/controllers/home_controller.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/message_view.dart';
import 'package:wit_niit_flutter2/app/modules/tools/views/tools_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: bottonBar.length,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Config.primarySwatchColor.shade50,
          child: TabBar(
            unselectedLabelColor: Colors.black12,
            labelColor: Config.primaryColor,
            // indicatorPadding: EdgeInsets.only(bottom: 5),
            indicator: BoxDecoration(
              border: Border(),
            ),
            tabs: bottonBar.keys
                .map((e) => Tab(
                      text: e,
                      icon: bottonBar[e],
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: tabView,
        ),
      ),
    );
  }
}

Map<String, Icon> bottonBar = {
  '消息': Icon(cIcons.icon_xiaoxi),
  '通讯录': Icon(cIcons.icon_tongxunlu),
  '工作台': Icon(cIcons.icon_gongzuotai),
  '工具箱': Icon(cIcons.icon_gongjuxiang),
};

List<Widget> tabView = [
  MessageView(),
  ContactsView(),
  BenchView(),
  ToolsView(),
];

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/live_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/live_add.dart';
import './live_card.dart';
import './live_data.dart';

class LivePage extends GetView<LiveController> {
  const LivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LiveController liveController = Get.put(LiveController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('直播'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                  controller: liveController.textController.value,
                  decoration: InputDecoration(
                      hintText: "请输入搜索词",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      contentPadding: EdgeInsets.only(bottom: 40 / 3),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black87.withOpacity(0.5), // 边框颜色
                        ),
                        borderRadius:BorderRadius.circular(10),
                      ),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.close,
                              size: 17,
                            ),
                            onPressed: () {
                              liveController.textController.value.text="";
                              // 收起软键盘
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            splashColor: Theme.of(context).primaryColor,
                          ),
                          IconButton(
                            color: Colors.grey,
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              size: 40,
                            ),
                          ),
                        ],
                      )),
                  onEditingComplete: () {
                    // widget.onEditingComplete?.call(controller.text);
                  }),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 90 / 100,
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(vertical: 5),
                children: liveList.map((LiveCardData data) {
                  return LiveCard(
                    cover: data.cover,
                    userId: data.userId,
                    roomId: data.roomId,
                    roomName: data.roomName,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.to(AddLive());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

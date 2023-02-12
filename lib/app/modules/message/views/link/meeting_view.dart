import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/component/Iconfont.dart';

class MeetingView extends GetView {
  const MeetingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('会议'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(cIcons.icon_more)
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("历史会议",style: TextStyle(color: Colors.grey),),
                IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.grey,))
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(cIcons.icon_rest,color: Colors.grey,size: 130,),
                  SizedBox(height: 10.h,),
                  Text("暂无会议",style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     ElevatedButton(onPressed: (){},
            //         child: Column(
            //           children: [
            //             Icon(cIcons.icon_quick),
            //             Text("快速会议")
            //           ],
            //         )
            //     )
            //   ],
            // )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: (){},
        child: Container(
          padding: EdgeInsets.only(left: 20),
          margin: EdgeInsets.only(),
          width: 100.w,
          height: 70.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(cIcons.icon_quick),
                  Text("快速会议")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(cIcons.icon_yuding),
                  Text("预定会议")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

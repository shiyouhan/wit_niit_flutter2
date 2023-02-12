import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupChatPage extends StatelessWidget {
  const GroupChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('群聊'),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          height: 60.h,
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(14.r, 10.r, 14.r, 0.r),
          child: GestureDetector(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0.r),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    Text(
                      '搜索',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
            // 点击搜索
            // onTap: () {
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (BuildContext context) => SearchPage())
            //   );
            // },
          ),
        ),
        SizedBox(height: 10.h),
        ListTile(
          title: Text(
            "计软院2022级新生班主任群",
            style: TextStyle(fontSize: 20.sp),
          ),
          leading:
              Image(image: AssetImage('assets/images/group.png'), width: 50.w),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => GroupChatPage())),
        ),
        SizedBox(height: 20.h),
        Text(
          '共1个群',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        )
      ]),
    );
  }
}

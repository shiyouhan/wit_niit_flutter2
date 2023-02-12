
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:r_calendar/r_calendar.dart';

class LinkCalendar extends StatefulWidget {
  const LinkCalendar({Key? key}) : super(key: key);

  @override
  State<LinkCalendar> createState() => _LinkCalendarState();
}

class _LinkCalendarState extends State<LinkCalendar> {
  late RCalendarController controller;
  String selectedDate = DateTime.now().toString();
  DateTime now = DateTime.now();
  static const dateStyle = TextStyle(
    fontSize: 16,
  );
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    controller = RCalendarController.single(
        selectedDate: DateTime.now(), isAutoSelect: true)
      ..addListener(() {
        setState(() {
          selectedDate = controller.selectedDate.toString();
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedDate.substring(0, 4)}年${selectedDate.substring(5, 7)}月',
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            print('返回消息页');
            Navigator.pop(context);
          },
        ),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.add, color: Colors.black),
          SizedBox(width: 17),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RCalendarWidget(
            controller: controller,
            customWidget: DefaultRCalendarCustomWidget(),
            firstDate: DateTime(1970, 1, 1), //当前日历的最小日期
            lastDate: DateTime(2055, 12, 31), //当前日历的最大日期
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            decoration: const BoxDecoration(
              // color: Colors.red,
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 1,
                  color: Color(0xFFE8E8EF),
                ),
              ),
            ),
            child: Row(
              children: [
                const Text(
                  '今天 · ',
                  style: dateStyle,
                ),
                Text(
                  '${now.month}月${now.day}日 ',
                  style: dateStyle,
                ),
                Text(
                  DateFormat('EEE', "zh_CN").format(DateTime.now()),
                  style: dateStyle,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            margin: const EdgeInsets.only(left: 16),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            decoration: const BoxDecoration(
              // color: Colors.red,
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 1,
                  color: Color(0xFFE8E8EF),
                ),
              ),
            ),
            child: const Text(
              '预定会议...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

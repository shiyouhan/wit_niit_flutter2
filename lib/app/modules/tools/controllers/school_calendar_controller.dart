import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class SchoolCalendarController extends GetxController {
  //TODO: Implement SchoolCalendarController

  late final ValueNotifier<List<Event>> selectedEvents;
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());

  PageController pageController = PageController();
  CalendarFormat calendarFormat = CalendarFormat.month;

  Map<String, Color> school_calendar = {
    "教学周": Colors.orangeAccent,
    "节假日": Colors.redAccent,
    "考试周": Colors.greenAccent,
    "事件": Colors.blue,
  };

  //获取事件
  List<Event> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  @override
  void onInit() {
    super.onInit();
    selectedEvents = ValueNotifier(getEventsForDay(focusedDay.value));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    focusedDay.dispose();
    selectedEvents.dispose();
    super.onClose();
  }

  //选择日期
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.focusedDay.value = focusedDay;

    selectedEvents.value = getEventsForDay(selectedDay);
  }
}

/// Example event class.
class Event {
  final String title;

  Event({required this.title});

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(kEventSource);

//日程记录
final kEventSource = {
  kToday: [
    Event(title: '1'),
  ],
  DateTime.utc(2022, 11, 17): [
    Event(title: '2'),
  ],
  DateTime.utc(2022, 11, 16): [
    Event(title: '3'),
  ],
  DateTime.utc(2022, 11, 18): [
    Event(title: '4'),
  ],
  DateTime.utc(2022, 11, 19): [
    Event(title: '1'),
  ],
  DateTime.utc(2022, 11, 20): [
    Event(title: '1'),
  ],
  DateTime.utc(2022, 11, 21): [
    Event(title: '1'),
  ],
  DateTime.utc(2022, 11, 22): [
    Event(title: '1'),
  ],
  DateTime.utc(2022, 11, 23): [
    Event(title: '1'),
  ],
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

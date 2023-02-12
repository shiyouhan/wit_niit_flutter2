import 'package:flutter/material.dart';

import '../routes/app_pages.dart';

class CardInfo {
  String desc;
  String toName;
  Icon icon;
  CardInfo(this.desc, this.toName, this.icon);
}

List<CardInfo> CardList = [
  CardInfo(
      '智慧教室',
      Routes.SCHEDULE,
      const Icon(
        // cIcons.icon_jiahao,
        Icons.account_balance,
        color: Color(0xff80d1c8),
      )),
  CardInfo(
      '日历',
      Routes.CALENDAR,
      const Icon(
        Icons.calendar_month_sharp,
        color: Color(0xff80d1c8),
      )),
  CardInfo(
      '课表',
      Routes.S_CALENDAR,
      const Icon(
        // cIcons.icon_jiahao,
        Icons.school,
        color: Color(0xff80d1c8),
      )),
  CardInfo(
      '微盘',
      Routes.DISK,
      const Icon(
        // cIcons.icon_jiahao,
        Icons.photo_library_outlined,
        color: Color(0xff80d1c8),
      )),
  CardInfo(
      '校历',
      Routes.SMART_CAMPUS,
      const Icon(
        // cIcons.icon_jiahao,
        Icons.calendar_today_sharp,
        color: Color(0xff80d1c8),
      )),
];

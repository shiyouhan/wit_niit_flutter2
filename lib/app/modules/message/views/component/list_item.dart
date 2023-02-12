import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  IconData icon;
  String title;
  String SubTitle;
  ListItem(this.icon, this.title, this.SubTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 120.w,

      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(SubTitle),
        trailing: Icon(
          Icons.chevron_right,
        ),
      ),
    );
  }
}

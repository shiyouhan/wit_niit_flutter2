import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  List<Menu> list;
  bool show;
  Color? iconColor;
  TextStyle? textStyle;
  SideMenu({Key? key, required this.list, required this.show,this.iconColor,this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          // offset: Offset(-10, 10),
          blurRadius: 1,
          spreadRadius: 5,
        )
      ]),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: _builderList,
        itemCount: list.length,
      ),
    );
  }

  Widget _builderList(BuildContext context, int index) {
    return MaterialButton(
      onPressed: list[index].function,
      child: Row(
        children: <Widget>[
          Icon(
            list[index].icon,
            color:iconColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            list[index].text,
            style:textStyle,
          ),
        ],
      ),
    );
  }
}

class Menu {
  IconData icon;
  String text;
  void Function()? function;

  Menu(this.icon, this.text, {this.function});
}

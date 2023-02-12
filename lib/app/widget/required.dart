import 'package:flutter/material.dart';

class chlRequired extends StatelessWidget {
  Text text;

  chlRequired({Key? key, required this.text, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.red,
          size: 12,
        ),
      text
      ],
    );
  }
}

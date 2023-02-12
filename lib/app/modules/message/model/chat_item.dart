
import 'package:flutter/material.dart';

class ChatItem {
  final String title;
  final String imgUrl;
  final VoidCallback onTap;
  ChatItem({required this.title, required this.imgUrl, required this.onTap});
}
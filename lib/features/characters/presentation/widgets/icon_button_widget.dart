import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget iconButton(IconData icon, Color color,
    {required VoidCallback onPressed}) {
  return IconButton(icon: Icon(icon, color: color), onPressed: onPressed);
}

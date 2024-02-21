import 'package:flutter/material.dart';

Widget subTextAction(String text, Function() func) {
  return Container(
    margin: const EdgeInsets.only(right: 30),
    child: InkWell(
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      ),
      onTap: func,
    ),
  );
}

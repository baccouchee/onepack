import 'package:flutter/material.dart';
import 'package:onepack/global/constants.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Time extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

return                Container(
  margin: EdgeInsets.only(left: defaultPadding),
  padding: EdgeInsets.symmetric(
    horizontal: defaultPadding,
    vertical: defaultPadding*2,
  ),
  decoration: BoxDecoration(
    color: secondaryColor,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    border: Border.all(color: Colors.white10),
  ),
  child: Row(
    children: [
      Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        child: Text("12:00:00"),
      ),
    ],
  ),
);
  }
}
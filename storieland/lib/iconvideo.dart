import 'package:flutter/animation.dart';

String getSvgPathBasedOnTime({VoidCallback? onPressed}) {
  DateTime now = DateTime.now();
  int hour = now.hour;

  if (hour >= 6 && hour < 12) {
    return 'assets/morning.png';
  } else if (hour >= 12 && hour < 18) {
    return 'assets/afternoon.png';
  } else {
    return 'assets/nightt.png';
  }
}

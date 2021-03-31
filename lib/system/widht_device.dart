import 'package:flutter/material.dart';

class WidhtDevice {
  widht(BuildContext context) {
    double widht = MediaQuery.of(context).size.width;
    if (widht >= 1600) {
      widht = widht / 4;
    } else if (widht >= 1360) {
      widht = widht / 3;
    } else if (widht >= 1020) {
      widht = widht / 2.5;
    } else if (widht >= 768) {
      widht = widht / 2;
    }
    return widht;
  }
}

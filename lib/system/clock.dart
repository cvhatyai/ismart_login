import 'package:intl/intl.dart';

class Clock {
  List thMonth = [
    "",
    "มกราคม",
    "กุมภาพันธ์",
    "มีนาคม",
    "เมษายน",
    "พฤษภาคม",
    "มิถุนายน",
    "กรกฎาคม",
    "สิงหาคม",
    "กันยายน",
    "ตุลาคม",
    "พฤศจิกายน",
    "ธันวาคม"
  ];
  getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = formatTime(now);
    return formattedDateTime;
  }

  String formatTime(DateTime dateTime) {
    return DateFormat('HH.mm').format(dateTime);
  }

  getDateTH() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = formatDate(now);
    List date = formattedDateTime.split("-");
    String day = date[0];
    String month = thMonth[int.parse(date[1])];
    String year = (int.parse(date[2]) + 543).toString();
    String display = day + ' ' + month + ' ' + year;
    return display;
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('d-M-y').format(dateTime);
  }
}

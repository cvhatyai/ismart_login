import 'package:ismart_login/page/front/model/sumaryToDay_absence.dart';
import 'package:ismart_login/page/front/model/sumaryToDay_late.dart';
import 'package:ismart_login/page/front/model/sumaryToDay_ontime.dart';

class ItemsSummaryToDay {
  final List<ItemsSummaryToDay_Ontime> ONTIME;
  final List<ItemsSummaryToDay_Late> LATE;
  final List<ItemsSummaryToDay_Absence> ABSENCE;

  ItemsSummaryToDay({
    this.ONTIME,
    this.LATE,
    this.ABSENCE,
  });

  factory ItemsSummaryToDay.fromJson(Map<String, dynamic> json) {
    return ItemsSummaryToDay(
      ONTIME: List.from(
          json['ontime'].map((m) => ItemsSummaryToDay_Ontime.fromJson(m))),
      LATE: List.from(
          json['late'].map((m) => ItemsSummaryToDay_Late.fromJson(m))),
      ABSENCE: List.from(
          json['absence'].map((m) => ItemsSummaryToDay_Absence.fromJson(m))),
    );
  }
}

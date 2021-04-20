class ItemsAttendHistoryResult {
  final String TIME;
  final String TIME_STATUS;
  final String STATUS;

  ItemsAttendHistoryResult({
    this.TIME,
    this.TIME_STATUS,
    this.STATUS,
  });

  factory ItemsAttendHistoryResult.fromJson(Map<String, dynamic> json) {
    return ItemsAttendHistoryResult(
      TIME: json['time'],
      TIME_STATUS: json['time_status'],
      STATUS: json['status'],
    );
  }
}

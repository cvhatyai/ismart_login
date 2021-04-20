class ItemsAttendHistoryResult {
  final String TIME;
  final String TIME_STATUS;
  final String STATUS;
  final String IMAGES;
  final String LAT;
  final String LNG;
  final String NOTE;

  ItemsAttendHistoryResult({
    this.TIME,
    this.TIME_STATUS,
    this.STATUS,
    this.IMAGES,
    this.LAT,
    this.LNG,
    this.NOTE,
  });

  factory ItemsAttendHistoryResult.fromJson(Map<String, dynamic> json) {
    return ItemsAttendHistoryResult(
      TIME: json['time'],
      TIME_STATUS: json['time_status'],
      STATUS: json['status'],
      IMAGES: json['images'],
      LAT: json['lat'],
      LNG: json['lng'],
      NOTE: json['note'],
    );
  }
}

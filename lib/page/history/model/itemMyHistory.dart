class ItemsMyHistory {
  final String ID;
  final String UID;
  final String CREATE_DATE_TH;
  final String START_TIME;
  final String START_IMAGE;
  final String START_NOTE;
  final String START_STATUS;
  final String END_TIME;
  final String END_IMAGE;
  final String END_NOTE;
  final String END_STATUS;

  ItemsMyHistory(
      {this.ID,
      this.UID,
      this.CREATE_DATE_TH,
      this.START_TIME,
      this.START_IMAGE,
      this.START_NOTE,
      this.START_STATUS,
      this.END_TIME,
      this.END_IMAGE,
      this.END_NOTE,
      this.END_STATUS});

  factory ItemsMyHistory.fromJson(Map<String, dynamic> json) {
    return ItemsMyHistory(
      ID: json['id'],
      UID: json['uid'],
      CREATE_DATE_TH: json['create_date_th'],
      START_TIME: json['start_time'],
      START_IMAGE: json['start_image'],
      START_NOTE: json['start_note'],
      START_STATUS: json['start_status'],
      END_TIME: json['end_time'],
      END_IMAGE: json['end_image'],
      END_NOTE: json['end_note'],
      END_STATUS: json['end_status'],
    );
  }
}

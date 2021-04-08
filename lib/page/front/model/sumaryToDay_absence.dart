class ItemsSummaryToDay_Absence {
  final String ID;
  final String FULLNAME;
  final String CREATE_DATE_TH;
  final String SUBJECT;
  final String DESCRIPTION;

  ItemsSummaryToDay_Absence({
    this.ID,
    this.FULLNAME,
    this.CREATE_DATE_TH,
    this.SUBJECT,
    this.DESCRIPTION,
  });

  factory ItemsSummaryToDay_Absence.fromJson(Map<String, dynamic> json) {
    return ItemsSummaryToDay_Absence(
      ID: json['id'],
      FULLNAME: json['fullname'],
      CREATE_DATE_TH: json['create_date_th'],
      SUBJECT: json['subject'],
      DESCRIPTION: json['description'],
    );
  }
}

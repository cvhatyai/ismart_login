class ItemsOrgList {
  final String ID;
  final String SUBJECT;
  final String DESCRIPTION;
  final String DATE_WORKING;
  final String TIME_INSITE;
  final String TIME_OUTSITE;

  ItemsOrgList({
    this.ID,
    this.SUBJECT,
    this.DESCRIPTION,
    this.DATE_WORKING,
    this.TIME_INSITE,
    this.TIME_OUTSITE,
  });

  factory ItemsOrgList.fromJson(Map<String, dynamic> json) {
    return ItemsOrgList(
      ID: json['id'],
      SUBJECT: json['subject'],
      DESCRIPTION: json['description'],
      DATE_WORKING: json['date_working'],
      TIME_INSITE: json['time_insite'],
      TIME_OUTSITE: json['time_outsite'],
    );
  }
}

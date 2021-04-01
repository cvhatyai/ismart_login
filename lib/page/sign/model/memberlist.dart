class ItemsMemberList {
  final String ID;
  final String USERNAME;
  final String PASSWORD;
  final String FULLNAME;
  final String ORG_ID;
  final String ORG_NAME;
  final String PHONE;

  ItemsMemberList({
    this.ID,
    this.USERNAME,
    this.PASSWORD,
    this.FULLNAME,
    this.ORG_ID,
    this.ORG_NAME,
    this.PHONE,
  });

  factory ItemsMemberList.fromJson(Map<String, dynamic> json) {
    return ItemsMemberList(
      ID: json['id'],
      USERNAME: json['username'],
      PASSWORD: json['password'],
      FULLNAME: json['fullname'],
      ORG_ID: json['org_id'],
      ORG_NAME: json['org_name'],
      PHONE: json['phone'],
    );
  }
}

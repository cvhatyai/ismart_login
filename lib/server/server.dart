final String _baseUrl = 'http://ismartlogin.cityvariety.com/';

class Server {
  static String url = _baseUrl;
  //------------
  //
  //--- OTP-----
  String postOtp = _baseUrl + 'member/setOtp';
  String getCheckOtp = _baseUrl + 'member/checkOtp';
  //--- Member -----
  String postMember = _baseUrl + 'member/postMember';
  String getMember = _baseUrl + 'member/getMember';
  // ---องค์กร
  String getOrg = _baseUrl + 'organization/getOrg';

  //---- สรุป  -- การทำงาน
  String getSummaryAllDay = _baseUrl + "summary/attendSummaryList";
  String getSummaryToDay = _baseUrl + "summary/attendDailyList";
  String getSummaryMeList = _baseUrl + "summary/attendList";
  //----- Login Logout
  String getAttandCheck = _baseUrl + "attend";
  String getAttandHistory = _baseUrl + "attend/attendHistory";
  String postAttandStart = _baseUrl + "attend/attendStart";
  String postAttandEnd = _baseUrl + "attend/attendEnd";
  String postAttandUploadImages = _baseUrl + "attend/appUploadFile";
  Server() : super();
}

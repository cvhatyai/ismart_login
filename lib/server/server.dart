final String _baseUrl = 'http://check-in.cityvariety.com/';
final String _apiName = 'app_api_v3/';
final String pathApi = _baseUrl + _apiName;

class Server {
  String url = _baseUrl;
  //------------
  String getApp = pathApi + 'showlist';
  //--- OTP-----
  String postOtp = pathApi + 'setOtp';
  String getCheckOtp = pathApi + 'checkOtp';
  //--- Member -----
  String postMember = pathApi + 'postMember';
  String getMember = pathApi + 'getMember';
  Server() : super();
}

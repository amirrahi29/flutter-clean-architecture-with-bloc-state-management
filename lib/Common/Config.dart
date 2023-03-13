import 'package:http/http.dart' as http;

class Config{

  // baseurl
  static String baseUrl = "https://jsonplaceholder.typicode.com";

  //endurl
  static String post = "/posts";
  static String comment = "/comments";

  //http client
  static var client = http.Client();

  //status Code
  static int TWO_HUNDRED_STATUS_CODE = 200;
  static int THREE_HUNDRED_STATUS_CODE = 300;
  static int FOUR_HUNDRED_STATUS_CODE = 400;

}
import 'package:http/http.dart' as http;

class APIServices {
  static Future selectCenter() {
    var url =
        "http://18.132.12.13.loanmanagmentsystem.merchantasiancredit.lk/apimodel/view/getcenters.php";
    return http.post(url as Uri,body:{});
  }
}
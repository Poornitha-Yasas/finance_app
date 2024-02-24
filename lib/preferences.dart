import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<List<String>> getStoredValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedValues = prefs.getStringList('inputValues') ?? [];
    return storedValues;
  }
}

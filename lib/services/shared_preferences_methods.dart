import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesOperations {
  //set preferred language
  Future<String?> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('language', language.toLowerCase());
    if (prefs.getString('language') == 'english') {
      print('Success');
    } else {
      print('hi');
    }
    return prefs.getString('language');
  }

  //set current age
  Future<int?> setAge(int age) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('age', age);
    if (prefs.getInt('age')! >= 21) {
      print('success');
    }
    return prefs.getInt('age');
  }
}

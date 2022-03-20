import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoplants/data/models/user.dart';
import 'package:shoplants/data/utils/const.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  // function to initialize shared preferences
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // function to persistent store user data locally with shared preferences
  static Future setUser(User user) async {
    final userJson = user.toJson();

    await _preferences.setString(Const.userId, userJson);
  }
}

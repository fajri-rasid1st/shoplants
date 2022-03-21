import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoplants/data/models/user.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  // function to initialize shared preferences
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // function to store persistent user data locally
  static Future<void> setUser(User user) async {
    final userJson = user.toJson();
    final userId = user.id;

    await _preferences.setString(userId, userJson);
  }

  // fucntion to read user data from persistent storage
  static User getUser(String userId) {
    final userJson = _preferences.getString(userId);

    return User.fromJson(userJson!);
  }
}

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoplants/data/models/user.dart';

class UserPreferences {
  static late SharedPreferences _userPreferences;

  // function to initialize shared preferences
  static Future init() async {
    _userPreferences = await SharedPreferences.getInstance();
  }

  // function to store persistent user data locally
  static Future<void> setUser(User user) async {
    final userJson = user.toJson();
    final userId = user.id;

    await _userPreferences.setString(userId, userJson);
  }

  // fucntion to read user data from persistent storage
  static User? getUser(String userId) {
    final userJson = _userPreferences.getString(userId);

    if (userJson != null) return User.fromJson(userJson);

    return null;
  }
}

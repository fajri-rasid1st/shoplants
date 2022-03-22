import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoplants/data/models/cart.dart';

class CartPreferences {
  static late SharedPreferences _cartPreferences;

  // function to initialize shared preferences
  static Future init() async {
    _cartPreferences = await SharedPreferences.getInstance();
  }

  // function to store persistent cart data locally
  static Future<void> setCart(Cart cart) async {
    final cartJson = cart.toJson();
    final cartId = cart.id;

    await _cartPreferences.setString(cartId, cartJson);
  }

  // fucntion to read cart data from persistent storage
  static Cart? getCart(String cartId) {
    final cartJson = _cartPreferences.getString(cartId);

    if (cartJson != null) return Cart.fromJson(cartJson);

    return null;
  }
}

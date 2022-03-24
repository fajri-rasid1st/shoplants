import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoplants/data/models/cart.dart';
import 'package:shoplants/data/models/plant.dart';
import 'package:shoplants/data/utils/const.dart';
import 'package:shoplants/data/utils/user_preferences.dart';
import 'package:shoplants/ui/screens/finished_order_screen.dart';
import 'package:shoplants/ui/styles/button_style.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';
import 'package:shoplants/ui/styles/text_style.dart';

class CheckoutPage extends StatelessWidget {
  final Plant plant;
  final Cart? cart;

  const CheckoutPage({
    Key? key,
    required this.plant,
    this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: secondaryTextColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Text(
            'Checkout',
            style: defaultHeader1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: plant.imgUrls[1],
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 200),
                  fadeOutDuration: const Duration(milliseconds: 200),
                  placeholder: (context, url) {
                    return Center(
                      child: SpinKitPulse(color: secondaryColor),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const Center(
                      child: Icon(Icons.image_not_supported_outlined),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      plant.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: defaultTitle,
                    ),
                    Text(
                      plant.alias,
                      style: TextStyle(color: secondaryColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Cares and Features:',
                      style: secondarySubTitle,
                    ),
                    Text(
                      plant.characteristics.join(", "),
                      style: secondarySubTitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: dividerColor),
        buildSection(
          text1: 'Recipient\'s name:',
          text2: UserPreferences.getUser(Const.userId)!.name,
          text3: '(${UserPreferences.getUser(Const.userId)!.address})',
        ),
        Divider(height: 1, thickness: 1, color: dividerColor),
        buildSection(
          text1: 'Payment Method:',
          text2: 'COD (Cash On Delivery)',
          text3: '(only support this payment method)',
        ),
        Divider(height: 1, thickness: 1, color: dividerColor),
        buildSection(
          text1: 'Delivery Service:',
          text2: 'Shoplants Express',
          text3: '(only support this service)',
        ),
        Divider(height: 1, thickness: 1, color: dividerColor),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Row(
            children: [
              Text(
                'Total: \$${plant.price}',
                style: primaryHeader2,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => makeOrder(context, cart),
                  child: const Text(
                    "Order Now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: elevatedButtonStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding buildSection({
    required String text1,
    required String text2,
    required String text3,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(color: primaryColor),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  text2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: primaryBoldText,
                ),
                Text(
                  text3,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: secondarySubTitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> makeOrder(BuildContext context, Cart? cart) async {
    // obtain shared preference
    final prefs = await SharedPreferences.getInstance();

    // if user checkout via cart list, delete cart that has been ordered
    if (cart != null) {
      prefs.remove(cart.id);
    }

    // navigate to finished order screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => const FinishedOrderScreen()),
      ),
    );
  }
}

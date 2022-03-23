import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoplants/data/models/cart.dart';
import 'package:shoplants/data/models/plant.dart';
import 'package:shoplants/data/utils/cart_preferences.dart';
import 'package:shoplants/data/utils/const.dart';
import 'package:shoplants/ui/screens/cart_screen.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';
import 'package:shoplants/ui/widgets/favorite_button_widget.dart';
import 'package:uuid/uuid.dart';

class DetailScreen extends StatefulWidget {
  final Plant plant;

  const DetailScreen({Key? key, required this.plant}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: secondaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded),
          tooltip: 'Back',
        ),
        actions: const <Widget>[FavoriteButtonWidget()],
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: widget.plant,
            transitionOnUserGestures: true,
            child: CachedNetworkImage(
              imageUrl: widget.plant.imgUrls[0],
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
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: 40,
                  ),
                );
              },
            ),
          ),
          Flexible(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 5,
                    color: secondaryTextColor,
                  ),
                ],
                color: backGroundColor,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      widget.plant.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.plant.alias,
                      style: TextStyle(color: primaryColor),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.plant.about,
                      style: TextStyle(color: secondaryTextColor),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          buildPlantCharacteristic(
                            icon: Icons.water_drop_outlined,
                            characteristic: widget.plant.characteristics[0],
                          ),
                          const SizedBox(width: 12),
                          buildPlantCharacteristic(
                            icon: Icons.wb_sunny_outlined,
                            characteristic: widget.plant.characteristics[1],
                          ),
                          const SizedBox(width: 12),
                          buildPlantCharacteristic(
                            icon: Icons.crop_free_outlined,
                            characteristic: widget.plant.characteristics[2],
                          ),
                          const SizedBox(width: 12),
                          buildPlantCharacteristic(
                            icon: Icons.thermostat_outlined,
                            iconSize: 40,
                            characteristic: widget.plant.characteristics[3],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        OutlinedButton(
                          onPressed: addToCart,
                          child: const Icon(Icons.add_shopping_cart),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_cart_checkout),
                            label: Text(
                              "Checkout \$${widget.plant.price}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildPlantCharacteristic({
    required IconData icon,
    required String characteristic,
    double? iconSize = 36,
  }) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: dividerColor,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: iconSize,
            color: secondaryColor,
          ),
          const SizedBox(height: 2),
          Text(
            characteristic,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  void addToCart() {
    CartPreferences.setCart(
      Cart(
        id: const Uuid().v4(),
        plant: widget.plant,
      ),
    ).then((_) async {
      // obtain shared preferences
      final prefs = await SharedPreferences.getInstance();

      // remove data for the default cart key
      await prefs.remove(Const.cartId).then((isSuccess) {
        if (isSuccess) {
          // create snackbar
          SnackBar snackBar = SnackBar(
            content: const Text(
              'Successfully added to cart',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Show Cart',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
            ),
          );

          // show snackbar
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      });
    });
  }
}

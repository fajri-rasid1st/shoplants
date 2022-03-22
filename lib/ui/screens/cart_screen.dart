import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoplants/data/utils/const.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';
import 'package:shoplants/ui/widgets/loading_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: primaryTextColor,
          ),
          tooltip: 'Back',
        ),
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline_rounded),
          )
        ],
        elevation: 0.8,
        titleSpacing: 16,
        toolbarHeight: 64,
        backgroundColor: backGroundColor,
      ),
      body: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (snapshot.data?.getString(Const.cartId) == 'empty') {
                return buildEmptyCart();
              }

              return const Text('ada');
            }
          }

          return const LoadingWidget();
        },
      ),
    );
  }

  Center buildEmptyCart() {
    return Center(
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            "assets/svg/Unboxing-cuate.svg",
            fit: BoxFit.cover,
          ),
          const Text('Oops, your cart is still empty!'),
        ],
      ),
    );
  }
}

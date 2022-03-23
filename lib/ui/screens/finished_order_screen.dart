import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoplants/data/utils/const.dart';
import 'package:shoplants/data/utils/user_preferences.dart';
import 'package:shoplants/ui/screens/loading_screen.dart';
import 'package:shoplants/ui/screens/main_screen.dart';
import 'package:shoplants/ui/styles/button_style.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';
import 'package:shoplants/ui/styles/text_style.dart';

class FinishedOrderScreen extends StatelessWidget {
  const FinishedOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        }

        return buildMainScreen(context);
      },
    );
  }

  Scaffold buildMainScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset(
                "assets/svg/Delivery-cuate.svg",
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              Text(
                'Nice, your order is being delivered!',
                style: defaultHeader2,
              ),
              Text(
                'While waiting, let\'s look at the other plants.',
                style: TextStyle(color: secondaryTextColor),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // navigate to home screen and pop all other screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return MainScreen(
                          user: UserPreferences.getUser(Const.userId)!,
                        );
                      }),
                    ),
                    (route) => false,
                  );
                },
                child: const Text('Discover Another Plants'),
                style: elevatedButtonStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoplants/ui/screens/main_screen.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // prevent landscape orientation
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // change status bar color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoplants',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
              displayColor: primaryTextColor,
              bodyColor: primaryTextColor,
            ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.light,
          primary: primaryColor,
          secondary: secondaryColor,
          tertiary: tertiaryColor,
          background: backGroundColor,
          error: dangerColor,
          outline: primaryTextColor,
          shadow: primaryTextColor,
        ),
        scaffoldBackgroundColor: backGroundColor,
      ),
      home: const MainScreen(),
    );
  }
}

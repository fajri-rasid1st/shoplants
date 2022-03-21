import 'package:flutter/material.dart';
import 'package:shoplants/data/models/user.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';

class MainScreen extends StatefulWidget {
  final User user;

  const MainScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // initialize final atributes
  late final List<Widget> _pages;

  // initialize atributes
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('data'),
      bottomNavigationBar: BottomNavigationBar(
        items: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.shopify),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar buildAppbar({required String title, required String imagePath}) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: primaryTextColor,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Clicked')),
              );
            },
            child: CircleAvatar(
              backgroundColor: secondaryColor,
              radius: 20,
              child: Image.asset(
                widget.user.imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
      titleSpacing: 16,
      toolbarHeight: 64,
      backgroundColor: backGroundColor,
      elevation: 0.8,
    );
  }
}

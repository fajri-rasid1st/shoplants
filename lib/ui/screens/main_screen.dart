import 'package:flutter/material.dart';
import 'package:shoplants/data/models/user.dart';
import 'package:shoplants/ui/pages/home_page.dart';
import 'package:shoplants/ui/pages/search_page.dart';
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
  String _title = 'Discover';

  @override
  void initState() {
    _pages = <Widget>[HomePage(user: widget.user), const SearchPage()];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(title: _title),
      body: buildMainScreen(),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar buildAppbar({required String title}) {
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
      elevation: 0.8,
      titleSpacing: 16,
      toolbarHeight: 64,
      backgroundColor: backGroundColor,
    );
  }

  Scaffold buildMainScreen() {
    return Scaffold(
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 0.1,
            spreadRadius: 0.1,
            color: secondaryTextColor,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;

              switch (index) {
                case 0:
                  _title = 'Discover';

                  break;
                case 1:
                  _title = 'Explore';

                  break;
              }
            });
          },
        ),
      ),
    );
  }

  FloatingActionButton buildFab() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: primaryColor,
      child: const Icon(
        Icons.shopify,
        size: 32,
      ),
      tooltip: 'Cart',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_recipe_app/home/presentation/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  final HomeScreen _homeScreen;
  final Widget _savedRecipesScreen;

  const NavigationScreen(
    this._homeScreen,
    this._savedRecipesScreen, {
    super.key,
  });

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      widget._homeScreen,
      widget._savedRecipesScreen,
      widget._homeScreen,
      widget._homeScreen,
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: _pages[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            _buildNavItem('home'),
            _buildNavItem('saved'),
            _buildNavItem('notification'),
            _buildNavItem('profile'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String iconName) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Image.asset('assets/icons/$iconName.png'),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Image.asset('assets/icons/$iconName-fill.png'),
      ),
      label: '',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/screen/home/home_screen.dart';
import 'package:food_recipe_app/presentation/screen/saved_recipes/saved_recipes_screen.dart';

class Navigation extends StatefulWidget {
  final HomeScreen _homeScreen;
  final SavedRecipesScreen _savedRecipesScreen;

  const Navigation(
    this._homeScreen,
    this._savedRecipesScreen, {
    super.key,
  });

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
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

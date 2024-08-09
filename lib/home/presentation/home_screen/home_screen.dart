import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/presentation/component/custom_search_bar.dart';
import 'package:food_recipe_app/home/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/home/presentation/home_screen/home_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  late StreamSubscription<String> _subscription;

  final categories = [
    'All',
    'Korean',
    'Japanese',
    'Chinese',
    'Italian',
    'Hawaiian'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);

    final viewModel = context.read<HomeViewModel>();

    _subscription = viewModel.categoryStream.listen((String category) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      final snackBar = SnackBar(content: Text('$category 이(가) 선택되었습니다.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Eqqmayo',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'What are you cooking today?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        height: 2,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 50,
                  child: Image.asset('assets/icons/avatar.png'),
                ),
              ],
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                context.push('/search_recipes_screen');
              },
              child: CustomSearchBar(
                placeholder: 'Search recipe',
                controller: _searchController,
                enabled: false,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 40,
              padding: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: TabBar(
                onTap: (index) =>
                    viewModel.onSelectedCategory(categories[index]),
                tabAlignment: TabAlignment.start,
                controller: _tabController,
                isScrollable: true,
                tabs:
                    categories.map((category) => Tab(text: category)).toList(),
                dividerHeight: 0,
                labelColor: Colors.white,
                unselectedLabelColor: const Color.fromARGB(255, 57, 152, 114),
                splashFactory: NoSplash.splashFactory,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 57, 152, 114),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: TabBarView(
                controller: _tabController,
                children: categories.map((category) {
                  return Stack(
                    children: [
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: viewModel.state.recipes
                            .map(
                              (recipe) => RecipeCard(recipe: recipe),
                            )
                            .toList(),
                      ),
                      if (viewModel.state.isLoading)
                        const Center(child: CircularProgressIndicator()),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

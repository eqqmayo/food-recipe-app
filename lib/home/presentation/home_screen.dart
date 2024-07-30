import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/presentation/component/custom_search_bar.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
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
                      style: const TextStyle(
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
          ],
        ),
      ),
    );
  }
}

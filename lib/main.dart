import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/ingredient.dart';
import 'package:food_recipe_app/data/model/profile.dart';
import 'package:food_recipe_app/presentation/component/creator_profile.dart';
import 'package:food_recipe_app/presentation/component/ingredient_item.dart';
import 'package:food_recipe_app/presentation/component/pop_up_dialog.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 30),
            IngredientItem(
              ingredient: Ingredient(
                image: 'assets/tomato.png',
                name: 'Tomatoes',
                weight: '500',
              ),
            ),
            CreatorProfile(
              profile: Profile(
                image: 'assets/cat.jpeg',
                name: 'Meow',
                location: 'LA, California',
              ),
            ),
            PopUpDialog(url: 'app.Recipe.co/keem_gelato')
          ],
        ),
      ),
    );
  }
}

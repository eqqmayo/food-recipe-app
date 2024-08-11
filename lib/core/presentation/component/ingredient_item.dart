import 'package:flutter/material.dart';
import 'package:food_recipe_app/recipe/domain/recipe_detail/model/ingredient.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({
    super.key,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 241, 241),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/${ingredient.image}'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 18),
            Text(
              ingredient.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              ingredient.weight,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

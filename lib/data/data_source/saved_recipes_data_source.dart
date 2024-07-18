import 'package:food_recipe_app/data/model/recipe.dart';

class SavedRecipeDataSource {
  final List<Recipe> _savedRecipes = [
    const Recipe(
      thumbnail:
          'https://blog.kakaocdn.net/dn/bmMO3k/btsFJGT7VFo/zA06H1YOBGgDuVKjMN9XO0/img.png',
      title: 'Rich flavored Okonomiyaki',
      creator: 'Hirokazu Koreeda',
      cookTime: '20',
      rating: '4.5',
    ),
    const Recipe(
      thumbnail:
          'https://cookwithdana.com/wp-content/uploads/2023/06/Untitled-design-3.png',
      title: 'Quick Korean Poke',
      creator: 'Ryan Gosling',
      cookTime: '10',
      rating: '4.0',
    ),
    const Recipe(
      thumbnail:
          'https://assets.clevelandclinic.org/transform/0ffb41ec-877c-4d21-951e-2f2ae50c29e3/acaiberrydiet-1298159858-770x533-1_jpg',
      title: 'Healthy Acai bowl',
      creator: 'Rachel McAdams',
      cookTime: '10',
      rating: '4.2',
    ),
    const Recipe(
      thumbnail:
          'https://blog.kakaocdn.net/dn/bmMO3k/btsFJGT7VFo/zA06H1YOBGgDuVKjMN9XO0/img.png',
      title: 'OkOkonomiyaki',
      creator: 'Hirokazu Koreeda',
      cookTime: '20',
      rating: '3.8',
    ),
  ];

  Future<List<Recipe>> getSavedRecipes() async {
    return _savedRecipes;
  }
}

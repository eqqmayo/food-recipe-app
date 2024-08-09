import 'package:food_recipe_app/core/domain/model/recipe.dart';

class SavedRecipeDataSource {
  final List<Recipe> _savedRecipes = [
    const Recipe(
      id: 1,
      thumbnail:
          'https://blog.kakaocdn.net/dn/bmMO3k/btsFJGT7VFo/zA06H1YOBGgDuVKjMN9XO0/img.png',
      title: 'Rich Flavored Okonomiyaki',
      creator: 'Hirokazu Koreeda',
      cookTime: 20,
      rating: 4.5,
      category: 'Japanese',
    ),
    const Recipe(
      id: 2,
      thumbnail:
          'https://cookwithdana.com/wp-content/uploads/2023/06/Untitled-design-3.png',
      title: 'Quick Korean Poke',
      creator: 'Ryan Gosling',
      cookTime: 10,
      rating: 4.0,
      category: 'Korean',
    ),
    const Recipe(
      id: 3,
      thumbnail:
          'https://assets.clevelandclinic.org/transform/0ffb41ec-877c-4d21-951e-2f2ae50c29e3/acaiberrydiet-1298159858-770x533-1_jpg',
      title: 'Healthy Acai Bowl',
      creator: 'Rachel McAdams',
      cookTime: 10,
      rating: 4.2,
      category: 'Hawaiian',
    ),
    const Recipe(
      id: 4,
      thumbnail:
          'https://blog.kakaocdn.net/dn/bmMO3k/btsFJGT7VFo/zA06H1YOBGgDuVKjMN9XO0/img.png',
      title: 'Okokonomiyaki',
      creator: 'Hirokazu Koreeda',
      cookTime: 20,
      rating: 3.8,
      category: 'Japanese',
    ),
    const Recipe(
      id: 5,
      thumbnail:
          'https://blog.kakaocdn.net/dn/bmMO3k/btsFJGT7VFo/zA06H1YOBGgDuVKjMN9XO0/img.png',
      title: 'Okonomiyaki',
      creator: 'Hirokazu Koreeda',
      cookTime: 20,
      rating: 4.5,
      category: 'Japanese',
    ),
    const Recipe(
      id: 6,
      thumbnail:
          'https://cookwithdana.com/wp-content/uploads/2023/06/Untitled-design-3.png',
      title: 'King Poke',
      creator: 'Ryan Gosling',
      cookTime: 10,
      rating: 4.0,
      category: 'Hawaiian',
    ),
    const Recipe(
      id: 7,
      thumbnail:
          'https://assets.clevelandclinic.org/transform/0ffb41ec-877c-4d21-951e-2f2ae50c29e3/acaiberrydiet-1298159858-770x533-1_jpg',
      title: 'Fresh Acai Bowl',
      creator: 'Rachel McAdams',
      cookTime: 10,
      rating: 4.2,
      category: 'Hawaiian',
    ),
    const Recipe(
      id: 8,
      thumbnail:
          'https://blog.kakaocdn.net/dn/bmMO3k/btsFJGT7VFo/zA06H1YOBGgDuVKjMN9XO0/img.png',
      title: 'Yokonomiyaki',
      creator: 'Hirokazu Koreeda',
      cookTime: 20,
      rating: 3.8,
      category: 'Japanese',
    ),
  ];

  Future<List<Recipe>> getSavedRecipes() async {
    return _savedRecipes;
  }
}

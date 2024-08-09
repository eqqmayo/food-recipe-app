import 'package:food_recipe_app/core/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/core/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/home/domain/home_screen/use_case/get_recipes_by_category_use_case.dart';
import 'package:food_recipe_app/home/presentation/home_screen/home_view_model.dart';
import 'package:food_recipe_app/recipe/data/saved_recipes/data_source/ingredient_data_source.dart';
import 'package:food_recipe_app/recipe/data/saved_recipes/data_source/procedure_data_source.dart';
import 'package:food_recipe_app/core/data/data_source/recipe_data_source.dart';
import 'package:food_recipe_app/recipe/data/saved_recipes/repository/ingredient_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/saved_recipes/repository/procedure_repository_impl.dart';
import 'package:food_recipe_app/core/domain/model/recipe.dart';
import 'package:food_recipe_app/home/presentation/home_screen/home_screen.dart';
import 'package:food_recipe_app/home/presentation/navigation/navigation_screen.dart';
import 'package:food_recipe_app/recipe/domain/saved_recipes/repository/ingredient_repository.dart';
import 'package:food_recipe_app/recipe/domain/saved_recipes/repository/procedure_repository.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/get_recipes_use_case.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/search_recipes_use_case.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/recipe_detail_screen.dart.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/recipe_detail_view_model.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:food_recipe_app/recipe/presentation/search_recipes/search_recipes_screen.dart';
import 'package:food_recipe_app/recipe/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:food_recipe_app/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:food_recipe_app/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:food_recipe_app/home/presentation/splash/splash_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton(RecipeDataSource());
  getIt.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(getIt()));

  getIt.registerSingleton(IngredientDataSource());
  getIt.registerSingleton<IngredientRepository>(
      IngredientRepositoryImpl(getIt()));

  getIt.registerSingleton(ProcedureDataSource());
  getIt
      .registerSingleton<ProcedureRepository>(ProcedureRepositoryImpl(getIt()));

  getIt.registerSingleton(GetRecipesUseCase(getIt()));
  getIt.registerSingleton(SearchRecipesUseCase(getIt()));
  getIt.registerSingleton(GetRecipesByCategoryUseCase(getIt()));

  getIt.registerFactory(() => HomeViewModel(getIt(), getIt()));
  getIt.registerFactory(() => SavedRecipesViewModel(getIt()));
  getIt.registerFactory(() => SearchRecipesViewModel(getIt(), getIt()));
  getIt.registerFactory(() => RecipeDetailViewModel(getIt(), getIt()));
}

final router = GoRouter(
  initialLocation: '/splash_screen',
  routes: [
    GoRoute(
      path: '/splash_screen',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/sign_in_screen',
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: '/sign_up_screen',
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: '/navigation',
      builder: (context, state) => NavigationScreen(
        HomeScreen(),
        ChangeNotifierProvider(
          create: (context) => getIt<SavedRecipesViewModel>(),
          child: const SavedRecipesScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/recipe_detail_screen',
      builder: (context, state) {
        final recipe = state.extra as Recipe;

        return ChangeNotifierProvider(
          create: (context) => getIt<RecipeDetailViewModel>(),
          child: RecipeDetailScreen(recipe: recipe),
        );
      },
    ),
    GoRoute(
      path: '/search_recipes_screen',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => getIt<SearchRecipesViewModel>(),
        child: const SearchRecipesScreen(),
      ),
    ),
  ],
);

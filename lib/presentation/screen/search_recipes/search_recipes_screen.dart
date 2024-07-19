import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/custom_search_bar.dart';
import 'package:food_recipe_app/presentation/component/square_recipe_card.dart';
import 'package:food_recipe_app/presentation/screen/search_recipes/search_recipes_view_model.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel _searchRecipesViewModel;

  const SearchRecipesScreen(
    this._searchRecipesViewModel, {
    super.key,
  });

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(_onTextChanged);
    super.initState();
  }

  void _onTextChanged() {
    widget._searchRecipesViewModel.searchRecipes(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onTextChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 20),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Search recipes',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              controller: _searchController,
              placeholder: 'Search recipe',
            ),
            const Text(
              'Search Result',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                height: 3.5,
              ),
            ),
            ListenableBuilder(
              listenable: widget._searchRecipesViewModel,
              builder: (context, child) {
                final recipes = widget._searchRecipesViewModel.recipes;
                return Expanded(
                  child: Stack(
                    children: [
                      GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          children: recipes
                              .map((recipe) => SquareRecipeCard(recipe: recipe))
                              .toList()),
                      if (widget._searchRecipesViewModel.isLoading)
                        const Center(child: CircularProgressIndicator()),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

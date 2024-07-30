import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/creator.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/presentation/component/creator_profile.dart';
import 'package:food_recipe_app/presentation/component/description_box.dart';
import 'package:food_recipe_app/presentation/component/ingredient_item.dart';
import 'package:food_recipe_app/presentation/component/noname_card.dart';
import 'package:food_recipe_app/presentation/screen/saved_recipes/recipe_detail_view_model.dart';
import 'package:provider/provider.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;
    final viewModel = context.read<RecipeDetailViewModel>();

    viewModel.getIngredients(widget.recipe.id);
    viewModel.getProcedures(widget.recipe.id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Hero(
              tag: recipe.id,
              child: NonameCard(
                thumbnail: recipe.thumbnail,
                rating: recipe.rating,
                cookTime: recipe.cookTime,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    recipe.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            CreatorProfile(
              creator: Creator(
                image: 'assets/images/cat.jpeg',
                name: recipe.creator,
                location: 'SYD, Australia',
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              height: 42,
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Ingredient'),
                  Tab(text: 'Procedure'),
                ],
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
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListenableBuilder(
                    listenable: viewModel,
                    builder: (context, child) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                const Text(
                                  '1 serve',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Text(
                                  '${viewModel.state.ingredients.length} items',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: viewModel.state.ingredients
                                  .map(
                                    (ingredient) =>
                                        IngredientItem(ingredient: ingredient),
                                  )
                                  .toList(),
                            ),
                          ),
                          if (viewModel.state.isLoading)
                            const Center(child: CircularProgressIndicator()),
                        ],
                      );
                    },
                  ),
                  ListenableBuilder(
                    listenable: viewModel,
                    builder: (context, child) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                const Text(
                                  '1 serve',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Text(
                                  '${viewModel.state.procedures.length} steps',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: viewModel.state.procedures
                                  .map(
                                    (procedure) => DescriptionBox(
                                      title: 'Step ${procedure.stepNum}',
                                      description: procedure.description,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          if (viewModel.state.isLoading)
                            const Center(child: CircularProgressIndicator()),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/presentation/component/pop_up_dialog.dart';
import 'package:food_recipe_app/recipe/domain/recipe_detail/model/creator.dart';
import 'package:food_recipe_app/core/domain/model/recipe.dart';
import 'package:food_recipe_app/core/presentation/component/creator_profile.dart';
import 'package:food_recipe_app/core/presentation/component/description_box.dart';
import 'package:food_recipe_app/core/presentation/component/ingredient_item.dart';
import 'package:food_recipe_app/core/presentation/component/noname_card.dart';
import 'package:food_recipe_app/recipe/presentation/recipe_detail/recipe_detail_view_model.dart';
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

    Future.microtask(() {
      // 바로 접근 못하므로 잠깐 딜레이 주기
      final viewModel = context.read<RecipeDetailViewModel>();
      viewModel.getIngredients(widget.recipe.id);
      viewModel.getProcedures(widget.recipe.id);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;
    final viewModel = context.watch<RecipeDetailViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            key: const Key('menu'),
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PopUpDialog(
                            onPressed: () {
                              viewModel.copyLinkToClipboard(
                                  'foodrecipe://recipe.com/${recipe.id}');
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                  'Link Copied',
                                  textAlign: TextAlign.right,
                                )),
                              );
                            },
                            url: 'foodrecipe://recipe.com/${recipe.id}');
                      },
                    );
                  },
                  leading: const Icon(Icons.share),
                  title: const Text('Share'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.star_rate),
                  title: Text('Rate Recipe'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.comment),
                  title: Text('Review'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Unsave'),
                ),
              ),
            ],
          ),
        ],
      ),
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
                  Column(
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
                  ),
                  Column(
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

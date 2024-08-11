import 'package:food_recipe_app/recipe/domain/recipe_detail/model/procedure.dart';

class ProcedureDataSource {
  final _procedures = [
    const Procedure(recipeId: 1, stepNum: 1, description: 'oko'),
    const Procedure(recipeId: 1, stepNum: 2, description: 'oko oko'),
    const Procedure(recipeId: 1, stepNum: 3, description: 'oko oko oko'),
    const Procedure(recipeId: 1, stepNum: 4, description: 'oko oko'),
    const Procedure(recipeId: 2, stepNum: 1, description: 'poke'),
    const Procedure(recipeId: 2, stepNum: 2, description: 'poke poke'),
    const Procedure(recipeId: 3, stepNum: 1, description: 'acai'),
    const Procedure(recipeId: 4, stepNum: 1, description: 'oko'),
    const Procedure(recipeId: 5, stepNum: 1, description: 'oko'),
    const Procedure(recipeId: 6, stepNum: 1, description: 'poke'),
    const Procedure(recipeId: 7, stepNum: 1, description: 'acai'),
    const Procedure(recipeId: 8, stepNum: 1, description: 'oko'),
  ];

  Future<List<Procedure>> getProcedures() async {
    return _procedures;
  }
}

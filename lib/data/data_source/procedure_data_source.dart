import 'package:food_recipe_app/data/model/procedure.dart';

class ProcedureDataSource {
  final _procedures = [
    const Procedure(recipeId: 1, stepNum: 1, description: 'blah'),
    const Procedure(recipeId: 1, stepNum: 2, description: 'blah blah'),
    const Procedure(recipeId: 1, stepNum: 3, description: 'blah blah blah'),
    const Procedure(recipeId: 1, stepNum: 4, description: 'blah blah'),
    const Procedure(recipeId: 2, stepNum: 1, description: 'blah'),
    const Procedure(recipeId: 2, stepNum: 2, description: 'blah blah'),
    const Procedure(recipeId: 3, stepNum: 1, description: 'blah'),
    const Procedure(recipeId: 4, stepNum: 1, description: 'blah'),
    const Procedure(recipeId: 5, stepNum: 1, description: 'blah'),
    const Procedure(recipeId: 6, stepNum: 1, description: 'blah'),
    const Procedure(recipeId: 7, stepNum: 1, description: 'blah'),
    const Procedure(recipeId: 8, stepNum: 1, description: 'blah'),
  ];

  Future<List<Procedure>> getProcedures() async {
    return _procedures;
  }
}

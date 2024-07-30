import 'package:food_recipe_app/recipe/domain/saved_recipes/model/procedure.dart';

abstract interface class ProcedureRepository {
  Future<List<Procedure>> getProcedures();
}

import 'package:food_recipe_app/recipe/domain/recipe_detail/model/procedure.dart';

abstract interface class ProcedureRepository {
  Future<List<Procedure>> getProcedures();
}

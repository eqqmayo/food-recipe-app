import 'package:food_recipe_app/recipe/data/recipe_detail/data_source/procedure_data_source.dart';
import 'package:food_recipe_app/recipe/domain/recipe_detail/model/procedure.dart';
import 'package:food_recipe_app/recipe/domain/recipe_detail/repository/procedure_repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource _procedureDataSource;

  ProcedureRepositoryImpl(this._procedureDataSource);

  @override
  Future<List<Procedure>> getProcedures() async {
    final procedures = await _procedureDataSource.getProcedures();
    return List.unmodifiable(procedures);
  }
}

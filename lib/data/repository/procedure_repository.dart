import 'package:food_recipe_app/data/data_source/procedure_data_source.dart';
import 'package:food_recipe_app/data/model/procedure.dart';

abstract interface class ProcedureRepository {
  Future<List<Procedure>> getProcedures();
}

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource _procedureDataSource;

  ProcedureRepositoryImpl(this._procedureDataSource);

  @override
  Future<List<Procedure>> getProcedures() async {
    final procedures = await _procedureDataSource.getProcedures();
    return List.unmodifiable(procedures);
  }
}

import 'package:food_recipe_app/core/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_ui_state.freezed.dart';
part 'home_ui_state.g.dart';

@freezed
class HomeUiState with _$HomeUiState {
  const factory HomeUiState({
    @Default('All') String currentCategory,
    @Default(false) bool isLoading,
    @Default([]) List<Recipe> recipes,
  }) = _HomeUiState;

  factory HomeUiState.fromJson(Map<String, Object?> json) =>
      _$HomeUiStateFromJson(json);
}

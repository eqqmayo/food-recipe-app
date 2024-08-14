import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/core/domain/model/recipe.dart';
import 'package:food_recipe_app/recipe/presentation/recipe_detail/recipe_detail_screen.dart.dart';
import 'package:food_recipe_app/recipe/presentation/recipe_detail/recipe_detail_view_model.dart';
import 'package:food_recipe_app/router.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  diSetup();

  final recipe = Recipe(
    id: 1,
    thumbnail:
        'https://blog.kakaocdn.net/dn/bmMO3k/btsFJGT7VFo/zA06H1YOBGgDuVKjMN9XO0/img.png',
    title: 'Rich Flavored Okonomiyaki',
    creator: 'Hirokazu Koreeda',
    cookTime: 20,
    rating: 4.5,
    category: 'Japanese',
  );

  group('Copy Link flow test', () {
    testWidgets('Copy Link flow test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => getIt<RecipeDetailViewModel>(),
            child: RecipeDetailScreen(recipe: recipe),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // final popupMenuButtonFinder = find.byIcon(Icons.more_horiz);
      final popupMenuButtonFinder = find.byKey(const Key('menu'));
      expect(popupMenuButtonFinder, findsOneWidget);
      await tester.tap(popupMenuButtonFinder);
      await tester.pumpAndSettle();

      final shareOptionFinder = find.text('Share');
      expect(shareOptionFinder, findsOneWidget);
      await tester.tap(shareOptionFinder);
      await tester.pumpAndSettle();

      final copyLinkButtonFinder = find.text('Copy Link');
      expect(copyLinkButtonFinder, findsOneWidget);
      await tester.tap(copyLinkButtonFinder);
      await tester.pumpAndSettle();

      final snackBarFinder = find.byType(SnackBar);
      expect(snackBarFinder, findsOneWidget);

      final snackBarTextFinder = find.text('Link Copied');
      expect(snackBarTextFinder, findsOneWidget);
    });
  });
}

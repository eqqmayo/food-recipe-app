import 'package:flutter/material.dart';
import 'package:food_recipe_app/router.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  diSetup();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    _initDeepLink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
    );
  }

  void _initDeepLink() async {
    try {
      final initialLink = await getInitialLink();
      if (initialLink != null) {
        _handleDeepLink(Uri.parse(initialLink));
      }
    } catch (e) {
      Exception('Failed to get initial link: $e');
    }

    linkStream.listen((String? link) {
      if (link != null) {
        _handleDeepLink(Uri.parse(link));
      }
    });
  }

  void _handleDeepLink(Uri uri) {
    if (uri.scheme == 'foodrecipe') {
      router.go(uri.path + (uri.query.isNotEmpty ? '?${uri.query}' : ''));
    }
  }
}

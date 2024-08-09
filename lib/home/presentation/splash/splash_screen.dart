import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/salmon.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.6),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    height: 1,
                    letterSpacing: 0.8,
                    color: Colors.white.withOpacity(0.95),
                  ),
                ),
                Text(
                  'Cooking',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    height: 1,
                    letterSpacing: 0.8,
                    color: Colors.white.withOpacity(0.95),
                  ),
                ),
                Text(
                  'Simple way to find Tasty Recipe',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    height: 2.5,
                    letterSpacing: 0.8,
                    color: Colors.white.withOpacity(0.95),
                  ),
                ),
                const SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    context.go('/sign_in_screen');
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(70, 70),
                    foregroundColor: Colors.white.withOpacity(0.95),
                    shape: CircleBorder(
                      side: BorderSide(
                          color: Colors.white.withOpacity(0.95), width: 2),
                    ),
                  ),
                  child: const Text(
                    '→',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

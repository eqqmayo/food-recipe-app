import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/presentation/component/big_button.dart';
import 'package:food_recipe_app/core/presentation/component/input_field.dart';
import 'package:food_recipe_app/core/presentation/component/text_devider.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 90),
            const Text(
              'Hello,',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 50),
            InputField(
              label: 'Email',
              placeholder: 'Enter Email',
              controller: _emailController,
            ),
            const SizedBox(height: 27),
            InputField(
              label: 'Enter Password',
              placeholder: 'Enter Password',
              controller: _passwordController,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 12,
                ),
              ),
            ),
            BigButton(
              height: 60,
              width: double.infinity,
              buttonText: 'Sign In  →',
              onTap: () {
                context.go('/navigation');
              },
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 6, 50, 0),
              child: TextDevider(label: 'Or Sign in With'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/google.png', width: 70),
                const SizedBox(width: 14),
                Image.asset('assets/icons/facebook.png', width: 70),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    context.go('/sign_up_screen');
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/presentation/component/big_button.dart';
import 'package:food_recipe_app/core/presentation/component/input_field.dart';
import 'package:food_recipe_app/core/presentation/component/text_devider.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  SignUpScreen({super.key});

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
            const SizedBox(height: 45),
            const Text(
              'Create an account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 1.6,
              ),
            ),
            const Text(
              'Let\'s help you set up your account,\nit won\'t take long.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            InputField(
              label: 'Name',
              placeholder: 'Enter Name',
              controller: _nameController,
            ),
            const SizedBox(height: 16),
            InputField(
              label: 'Email',
              placeholder: 'Enter Email',
              controller: _emailController,
            ),
            const SizedBox(height: 16),
            InputField(
              label: 'Password',
              placeholder: 'Enter Password',
              controller: _passwordController,
            ),
            const SizedBox(height: 16),
            InputField(
              label: 'Confirm Password',
              placeholder: 'Retype Password',
              controller: _confirmController,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 16, 10, 18),
              child: Text(
                'Accept terms & Condition',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 12,
                ),
              ),
            ),
            BigButton(
              height: 58,
              width: double.infinity,
              buttonText: 'Sign Up  →',
              onTap: () {
                context.go('/navigation');
              },
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 4, 30, 0),
              child: TextDevider(label: 'Or Sign in With'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/google.png', width: 60),
                const SizedBox(width: 12),
                Image.asset('assets/icons/facebook.png', width: 60),
              ],
            ),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already a member?',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    context.go('/sign_in_screen');
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 12,
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

import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final double height;
  final double width;
  final String buttonText;
  final void Function()? onTap;

  const BigButton({
    super.key,
    required this.height,
    required this.width,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onTap ?? () {},
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 57, 152, 114),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

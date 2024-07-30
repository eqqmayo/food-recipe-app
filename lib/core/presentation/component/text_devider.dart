import 'package:flutter/material.dart';

class TextDevider extends StatelessWidget {
  final String label;

  const TextDevider({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            height: 50,
            color: Color.fromARGB(255, 219, 218, 218),
            thickness: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 219, 218, 218),
              )),
        ),
        const Expanded(
          child: Divider(
            height: 50,
            color: Color.fromARGB(255, 219, 218, 218),
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}

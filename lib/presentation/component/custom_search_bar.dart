import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool enabled;
  final void Function(String)? onChanged;

  const CustomSearchBar({
    super.key,
    required this.placeholder,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onChanged,
            enabled: enabled,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 218, 218, 218),
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/icons/search.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 57, 152, 114),
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 218, 218, 218),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 57, 152, 114),
                  width: 1.5,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          width: 46,
          height: 46,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 57, 152, 114),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child:
                Image.asset('assets/icons/setting.png', width: 30, height: 30),
          ),
        ),
      ],
    );
  }
}

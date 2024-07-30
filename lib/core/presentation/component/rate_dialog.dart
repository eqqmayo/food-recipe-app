import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateDialog extends StatefulWidget {
  const RateDialog({super.key});

  @override
  State<RateDialog> createState() => _RateDialogState();
}

class _RateDialogState extends State<RateDialog> {
  double _currentRating = 3;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 3,
      shadowColor: Colors.grey,
      title: const Center(
          child: Text(
        'Rate Recipe',
        style: TextStyle(fontWeight: FontWeight.w500),
      )),
      contentPadding: const EdgeInsets.only(top: 10, bottom: 16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RatingBar.builder(
            initialRating: _currentRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, index) {
              if (index < _currentRating) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              } else {
                return const Icon(
                  Icons.star_border,
                  color: Colors.amber,
                );
              }
            },
            onRatingUpdate: (rating) {
              setState(() {
                _currentRating = rating;
              });
            },
          ),
        ],
      ),
      actionsPadding: const EdgeInsets.only(bottom: 15),
      actions: [
        Center(
          child: SizedBox(
            width: 100,
            height: 40,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Send',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

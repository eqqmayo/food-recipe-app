import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
  final String url;
  final void Function()? onPressed;

  const PopUpDialog({
    super.key,
    required this.url,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 300,
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      child: AlertDialog(
        title: Stack(
          children: [
            const Text(
              'Recipe Link',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child:
                      const Icon(Icons.close, size: 12, color: Colors.black87),
                ),
              ),
            )
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Copy recipe link and share your recipe link with friends and family.',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      url,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    child: TextButton(
                      onPressed: onPressed,
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 67, 139, 92),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Copy Link',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      ),
    );
  }
}

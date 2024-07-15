import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/profile.dart';

class CreatorProfile extends StatelessWidget {
  final Profile profile;

  const CreatorProfile({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(profile.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/gps.png',
                      height: 16,
                      width: 16,
                    ),
                    SizedBox(width: 3),
                    Text(
                      profile.location,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            SizedBox(
              height: 50,
              width: 90,
              child: TextButton(
                onPressed: () {},
                child: Text('Follow'),
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 67, 139, 92),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

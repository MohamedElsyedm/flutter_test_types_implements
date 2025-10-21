import 'package:flutter/material.dart';
import 'package:flutter_test_types_implements/unit_test_folder/util/time_helper.dart';

class ShowTimeOfDayScreen extends StatelessWidget {
  const ShowTimeOfDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/${TimeHelper.getTimeOfDay()}.jpeg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            FittedBox(
              child: Text(
                'GOOD ${TimeHelper.getTimeOfDay().toUpperCase()}',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

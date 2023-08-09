import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {

  const SummaryCard({
    super.key, required this.title, required this.number,
  });
  final String title;
  final int number;
  @override
  Widget build(BuildContext context) {

    return  Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("$number", style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24
            ),),
            Text(title)
          ],
        ),
      ),
    );
  }
}
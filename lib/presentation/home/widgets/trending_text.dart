import 'package:flutter/material.dart';

class TrendingText extends StatelessWidget {
  const TrendingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16),
      child: const Text(
        'Trendings 🔥',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }
}

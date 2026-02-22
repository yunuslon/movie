import 'package:flutter/material.dart';

class VideoVoteAverage extends StatelessWidget {
  final double voteAverage;
  const VideoVoteAverage({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    String label = voteAverage.toStringAsFixed(1);

    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber, size: 20),
        SizedBox(width: 2),
        Text(label),
      ],
    );
  }
}

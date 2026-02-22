import 'package:flutter/material.dart';

class VideoReleaseDate extends StatelessWidget {
  final DateTime releaseDate;
  const VideoReleaseDate({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    String date = releaseDate.toString().split(' ')[0];

    return Row(
      children: [
        Icon(Icons.calendar_month, size: 20, color: Colors.grey),
        Text(date, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

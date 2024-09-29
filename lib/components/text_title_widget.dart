import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final String text;
   TextTitleWidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text("${text}",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        )
    );
  }
}

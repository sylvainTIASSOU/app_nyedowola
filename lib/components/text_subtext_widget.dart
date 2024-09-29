import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  final String text;
   SubtitleWidget({
    super.key,
     required this.text
  });
  

  @override
  Widget build(BuildContext context) {
    return Text("${text}",style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w100,
    ));
  }
}

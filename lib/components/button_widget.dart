import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final dynamic action;
  const ButtonWidget({
    super.key,
    required this.action
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  action,
      child: Container(
        width: double.infinity,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Prendre rendez-vous ",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.calendar_month_outlined, size: 40, color: Colors.white)
          ],
        ),
      ),
    );
  }
}



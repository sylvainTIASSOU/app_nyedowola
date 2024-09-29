import 'package:flutter/material.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String title;
  final dynamic action;
  const SecondaryButtonWidget({
    super.key, required this.title, this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: action,
        child: Text("$title", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
              Colors.orangeAccent), // Arrière-plan orange
          shape:
          WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  30.0), // Bords bien arrondis
            ),
          ),
        ),
      ),
    );
  }
}
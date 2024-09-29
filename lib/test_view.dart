import 'package:flutter/material.dart';

class CheckMarkBorderContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: CheckMarkClipper(),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue[100],
            ),
            child: Center(
              child: Text(
                "Contenu",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckMarkClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Commencez du coin supérieur gauche
    path.moveTo(0, 0);

    // Commencez par le coin supérieur gauche
    path.moveTo(0, 0);

    // Début de la coche gauche
    path.lineTo(size.width * 0.3, 0); // Ligne horizontale à gauche
    path.lineTo(size.width * 0.5, size.height * 0.3); // Inclinaison vers le bas à droite

    // Créez le creux
    path.lineTo(size.width * 0.7, 0); // Remontez vers le haut à droite
    path.lineTo(size.width, 0); // Bord droit

    // Fermez le reste du chemin pour dessiner les autres côtés du conteneur
    path.lineTo(size.width, size.height); // Descendez le côté droit
    path.lineTo(0, size.height); // Ligne horizontale en bas
    path.close(); // Fermez le chemin

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

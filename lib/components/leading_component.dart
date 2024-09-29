import 'package:flutter/material.dart';

import '../utils/page_transition.dart';


class LeadingComponent extends StatelessWidget {
  final Widget page;
  const LeadingComponent({
    super.key,
    required this.page
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushReplacement(FadeRoute(page: page));
      },
      child: Container(
        width: 30, // Taille fixe du conteneur (ajuster selon les besoins)
        height: 30, // Taille fixe du conteneur
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.only(left: 5),
        // Pour ajouter un espace autour du bouton

        decoration: BoxDecoration(
          color: Colors.grey[100], // Arrière-plan gris
          shape: BoxShape.circle, // Forme ronde
          border: Border.all(color: Colors.blue, width: 3), // Bordure bleue
        ),
        child: Center(child: Icon(Icons.arrow_back_ios, color: Colors.blue, size: 18,)),

      ),
    );
  }
}

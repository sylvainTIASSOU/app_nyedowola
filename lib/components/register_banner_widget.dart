import 'package:flutter/material.dart';
import 'package:nyedowola/views/login_view/login_view.dart';

import '../utils/page_transition.dart';
import '../views/onboarding_view.dart';


class RegisterBannerWidget {
  // Fonction pour afficher le dialogue
  static void showSignupDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // L'utilisateur ne peut pas fermer le dialogue en appuyant en dehors
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false, // Empêche la fermeture du dialogue avec le bouton retour
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Image.asset("assets/images/SignUp.png"),

                  Text(
                    "Créez un compte pour accéder à plus de services!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(FadeRoute(page: LoginView())); // Redirection vers la page de création de compte
                    },
                    child: Text("Créer un compte"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Fermer la boîte de dialogue
                    },
                    child: Text("Continuer sans compte"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

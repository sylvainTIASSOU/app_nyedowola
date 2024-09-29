import 'package:flutter/material.dart';

import '../utils/page_transition.dart';
import '../views/tabs_view.dart';

class LoginController {
  // Fonction pour valider le numéro de téléphone
  static String?  validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le numéro de téléphone est requis';
    } else if (!RegExp(r'^[0-9]{8}$').hasMatch(value)) {
      return 'Veuillez entrer un numéro de téléphone valide (10 chiffres)';
    }
    return null;
  }


  // Fonction pour valider le mot de passe
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis';
    } else if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    }
    return null;
  }

  // Fonction de soumission du formulaire
  static void submitForm (dynamic _formKey, BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Si le formulaire est valide
      print('Formulaire valide');
        Navigator.of(context).pushReplacement(FadeRoute(page: TabsView()));

      // Traitez les données ici, comme la connexion à un serveur
    } else {
      print('Formulaire invalide');
    }
  }


}
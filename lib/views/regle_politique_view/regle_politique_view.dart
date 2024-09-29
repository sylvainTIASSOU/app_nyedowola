import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nyedowola/views/tabs_view.dart';

import '../../utils/page_transition.dart';
class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Politique de Confidentialité"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Politique de Confidentialité et de Sécurité',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  buildSectionTitle('1. Fonctionnalité principale de l\'application'),
                  buildSectionText(
                      'Notre application permet aux utilisateurs de réserver des services à domicile tels que le nettoyage, les réparations électriques, la plomberie, etc. Grâce à une interface simple, les utilisateurs peuvent choisir un service, sélectionner un professionnel, et réserver un créneau horaire adapté à leurs besoins.'),
                  SizedBox(height: 16),
                  buildSectionTitle('2. Collecte et utilisation des informations'),
                  buildSectionText(
                      'Nous collectons certaines informations personnelles, telles que le nom, l\'adresse, le numéro de téléphone et les informations de paiement pour assurer une bonne gestion des réservations et des transactions.'),
                  SizedBox(height: 16),
                  buildSectionTitle('3. Permissions d\'accès'),
                  buildSectionText(
                      '- Localisation : Pour proposer des services près de chez vous.\n'
                          '- Contacts : Pour faciliter le partage des détails du service ou la recommandation à des amis.\n'
                          '- Stockage : Pour sauvegarder des reçus ou des détails de réservation.'),
                  SizedBox(height: 16),
                  buildSectionTitle('4. Partage de données avec des tiers'),
                  buildSectionText(
                      'Nous ne partageons vos informations personnelles avec des tiers que dans le cadre de la prestation du service.'),
                  SizedBox(height: 16),
                  buildSectionTitle('5. Utilisation des données pour le marketing ou la publicité'),
                  buildSectionText(
                      'Nous pouvons utiliser vos informations pour vous envoyer des offres spéciales ou des promotions sur des services.'),
                  SizedBox(height: 16),
                  buildSectionTitle('6. Suivi des données des utilisateurs'),
                  buildSectionText(
                      'Nous utilisons des outils analytiques pour suivre l\'utilisation de l\'application et comprendre comment améliorer nos services.'),
                  SizedBox(height: 16),
                  buildSectionTitle('7. Sécurité des données'),
                  buildSectionText(
                      'Nous mettons en œuvre des mesures de sécurité strictes pour protéger vos informations personnelles.'),
                  SizedBox(height: 16),
                  buildSectionTitle('8. Droit d\'accès et de désinscription'),
                  buildSectionText(
                      'Vous avez le droit d\'accéder, de corriger ou de supprimer vos informations personnelles à tout moment.'),
                  SizedBox(height: 16),
                  buildSectionTitle('9. Cookies'),
                  buildSectionText(
                      'Notre application utilise des cookies pour améliorer l\'expérience utilisateur.'),
                  SizedBox(height: 16),
                  buildSectionTitle('10. Modification de cette politique de confidentialité'),
                  buildSectionText(
                      'Nous nous réservons le droit de modifier cette politique de confidentialité à tout moment.'),
                  SizedBox(height: 16),
                  buildSectionTitle('11. Nous contacter'),
                  buildSectionText(
                      'Si vous avez des questions concernant cette politique de confidentialité, vous pouvez nous contacter à l\'adresse suivante : support@nomdelapplication.com.'),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
          // Les boutons fixés en bas
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Fermer l'application lorsqu'on clique sur "Refuser"
                    SystemNavigator.pop(); // Quitter l'application
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text("Refuser", style: TextStyle(color: Colors.white),),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(FadeRoute(page: TabsView()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text("Accepter", style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildSectionText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18),
    );
  }
}


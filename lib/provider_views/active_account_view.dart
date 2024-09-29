import 'package:flutter/material.dart';
import 'package:nyedowola/provider_views/service_chart.dart';

import '../components/service_line_chart.dart';

class ActiveAccountView extends StatefulWidget {
  const ActiveAccountView({super.key});

  @override
  State<ActiveAccountView> createState() => _ActiveAccountViewState();
}

class _ActiveAccountViewState extends State<ActiveAccountView> {
  // Exemple de données pour le nombre de services par mois
  final List<double> monthlyServices = [50, 30, 15, 20, 25, 30, 55, 40, 20, 50, 55, 60];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vue d'ensemble",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
               Container(
                  height: 450, // Hauteur fixe pour le GridView
                  child: GridView.count(
                    crossAxisCount: 2, // Deux cartes par ligne
                    childAspectRatio: 1.6/1.5, // Ratio de largeur/hauteur des cartes
                    mainAxisSpacing: 16.0, // Espacement vertical entre les cartes
                    crossAxisSpacing: 16.0, // Espacement horizontal entre les cartes
                    children: [
                      _buildCard('Prix Total', '\$500', Icons.attach_money),
                      _buildCard('Services Rendus', '120', Icons.check_circle),
                      _buildCard('Nombre de Ratings', '250', Icons.star),
                      _buildCard('Services en Attente', '5', Icons.hourglass_empty),
                    ],
                  ),
                ),

              Text(
                "Evolution des services rendu",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SimpleLineChart( dataPoints: monthlyServices,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCard(String title, String value, IconData icon) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.blueAccent),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

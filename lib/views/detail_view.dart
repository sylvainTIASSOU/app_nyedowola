import 'package:flutter/material.dart';
import 'package:nyedowola/components/text_title_widget.dart';
import 'package:nyedowola/views/tabs_view.dart';
import '../components/booking_sheet_widget.dart';
import '../components/button_widget.dart';
import '../components/full_screen_image.dart';
import '../components/leading_component.dart';
import 'package:full_screen_image/full_screen_image.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final List<String> imagePaths = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingComponent(page: TabsView()),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Category",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            TextTitleWidget(text: "Installation de système de climatisation"),
            SizedBox(height: 30),

            // Profil
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Profil
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Forme ronde
                    border: Border.all(color: Colors.blue, width: 0),
                  ),
                  child: Image.asset("assets/images/profil.png"),
                ),
                SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nom
                    Row(
                      children: [
                        Icon(Icons.person_outline_rounded, size: 30),
                        SizedBox(width: 5),
                        Text(
                          "Nom prenom",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 30),
                        SizedBox(width: 5),
                        Text(
                          "kevé, assiko",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.timer_outlined, size: 30),
                        SizedBox(width: 5),
                        Text(
                          "De lundi a vendredi : 9h a16",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            ButtonWidget(
              action: () {
                // Use Builder to get a new context that is under the Scaffold
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return BookingSheetWidget();
                  },
                );
              },
            ),

            // Galerie de photo
            SizedBox(height: 35),
            Text(
              "Galerie de photo",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Utiliser Expanded ici
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Nombre de colonnes
                    crossAxisSpacing:
                        10.0, // Espacement horizontal entre les images
                    mainAxisSpacing:
                        10.0, // Espacement vertical entre les images
                  ),
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Ouvre l'image en plein écran lorsqu'elle est cliquée
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FullScreenImage(imagePath: imagePaths[index]),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(15.0), // Arrondi des bords
                        child: Image.asset(
                          imagePaths[index],
                          fit: BoxFit
                              .cover, // Ajuste l'image pour couvrir la cellule
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


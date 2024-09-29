import 'package:flutter/material.dart';
import 'package:nyedowola/components/search_input_widget.dart';
import 'package:nyedowola/views/services_view.dart';
import 'package:nyedowola/views/tabs_view.dart';

import '../components/leading_component.dart';
import '../utils/page_transition.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesView();
}

class _CategoriesView extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nos Categories de service"),
        leading: LeadingComponent(page: TabsView()),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: SearchInputWidget(), // Ton widget de recherche
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Nombre de colonnes : 2
                crossAxisSpacing: 10, // Espacement horizontal entre les cartes
                mainAxisSpacing: 10,  // Espacement vertical entre les cartes
                childAspectRatio: 3 / 3, // Ratio hauteur/largeur pour chaque carte
              ),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(FadeRoute(page: ServicesView()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/image1.jpg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity, // Hauteur de l'image
                        ),

                       Positioned(
                         child: Container(
                           alignment: Alignment(0.2, 0.7),
                           child: Text(
                             "Alou Kossivi",
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 30,
                                 color: Colors.white),
                           ),
                         ),
                       )

                       /* Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "Category",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Alou Kossivi",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              Text(
                                "Service name",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.blueAccent[200]),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Reserver",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(Icons.book, color: Colors.white, size: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),*/
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

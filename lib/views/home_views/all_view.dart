import 'package:flutter/material.dart';
import 'package:nyedowola/components/search_input_widget.dart';
import 'package:nyedowola/views/services_view.dart';
import '../../utils/page_transition.dart';

class AllView extends StatefulWidget {
  const AllView({super.key});

  @override
  State<AllView> createState() => _AllViewState();
}

class _AllViewState extends State<AllView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nos services"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SearchInputWidget(),

              const SizedBox(
                height: 20,
              ),

              // categories
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45, // Hauteur de la liste
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                        15,
                            (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8.0),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.fromBorderSide(
                                      BorderSide(color: Colors.blueAccent, width: 2))),
                              child: Center(
                                child: Text(
                                  'categori Item $index',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        )),
                  ),
                ),
              ),

              // services label
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Liste des Services",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(FadeRoute(page: ServicesView()));
                    },
                    icon: Icon(
                      Icons.bookmark,
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              // services
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true, // Permet à ListView de prendre seulement l'espace nécessaire
                  physics: NeverScrollableScrollPhysics(), // Désactive le scroll interne
                  itemCount: 10, // Nombre d'éléments à générer
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 150, // Hauteur de chaque élément
                          margin: const EdgeInsets.only(bottom: 10.0),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/image1.jpg",
                                fit: BoxFit.cover, // Adapte l'image pour couvrir toute la page
                                width: 150,
                                height: double.infinity,
                                alignment: Alignment.center,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Text(
                                        "Category",
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ),
                                    Text(
                                      "Alou Kossivi",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Service name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.blueAccent[200]),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Reserver",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                              Icon(
                                                Icons.book,
                                                color: Colors.white,
                                                size: 25,
                                              )
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

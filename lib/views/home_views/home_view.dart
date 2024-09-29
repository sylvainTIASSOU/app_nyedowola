import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nyedowola/components/SideMenu.dart';
import 'package:nyedowola/components/home_service_widget.dart';
import 'package:nyedowola/views/detail_view.dart';
import 'package:nyedowola/views/login_view/login_view.dart';
import 'package:nyedowola/views/notifications_view.dart';
import 'package:nyedowola/views/profil_view.dart';

import '../../components/register_banner_widget.dart';
import '../../components/search_input_widget.dart';
import '../../provider_views/provider_tabs_view.dart';
import '../../utils/page_transition.dart';
import '../categories_view.dart';
import '../services_view.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  final _box = Hive.box("appBox");
  bool isUserLoggedIn = false; // Variable pour vérifier si l'utilisateur est connecté ou non

  @override
  void initState() {
    super.initState();
    isUserLoggedIn = _box.get("is_connect", defaultValue: false);
    // Affiche la boîte de dialogue après le rendu initial si l'utilisateur n'est pas connecté
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isUserLoggedIn) {
        RegisterBannerWidget.showSignupDialog(context);
      }
    });
  }



  // Simule le chargement des données avec un délai
  Future<void> _loadServices() async {
    await Future.delayed(Duration(seconds: 3)); // Simuler le chargement de données
    setState(() {
      isLoading = false; // Mettre fin au chargement après 3 secondes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/icons/logo3.png",fit: BoxFit.contain,
          width: 120,
          height: 120,
        ),
        ///const Text("Nyedowola", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(FadeRoute(page: NotificationsView()));
            },
            icon: const Icon(Icons.notifications_none, size: 35,),
          ),

          IconButton(
            onPressed: () {
              isUserLoggedIn ? Navigator.of(context).pushReplacement(FadeRoute(page: ProfilView())) :
              Navigator.of(context).pushReplacement(FadeRoute(page: ProviderTabsView()));
            },
            icon: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              ),
                child: Center(
                  child: Image.asset("assets/images/profil.png")
                )
            ),
          ),
        ],
      ),


      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(
              height: 5,
            ),

            Text(
              "Salut!! 👋",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            // seaech input
            SearchInputWidget(),

            const SizedBox(
              height: 20,
            ),

            // cateroty designation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                IconButton(onPressed: (){
                  Navigator.of(context).pushReplacement(FadeRoute(page: CategoriesView()));
                }, icon: Icon(Icons.arrow_forward_rounded, size: 20, color: Colors.blueAccent,),)
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            //categories

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
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(FadeRoute(page: ServicesView()));
                            },
                            child: Container(
                              // Largeur de chaque élément
                              margin: const EdgeInsets.only(right: 8.0),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(15),
                                border: Border.fromBorderSide(BorderSide(color: Colors.blueAccent, width: 2))
                              ),
                              // Couleur différente pour chaque élément
                              child: Center(
                                child: Text(
                                  'categori Item $index',
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),

                        ],
                      )
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //services label
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Services",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),

                IconButton(onPressed: (){
                  Navigator.of(context).pushReplacement(FadeRoute(page: ServicesView()));
                }, icon: Icon(Icons.arrow_forward_rounded, size: 20, color: Colors.blueAccent,),)

              ],
            ),

            const SizedBox(
              height: 20,
            ),

            // services

            (isLoading ?ServiceShimmer() : Services(context)),

            const SizedBox(
              height: 30,
            ),

            // service client
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Container(
                      width: 80,
                      height: 80,
                      child: Image.asset("assets/images/profil.png"),
                    ),


                       Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Besoin d'aide? ",style: TextStyle(
                               color: Colors.white,
                               fontSize: 20,
                               fontWeight: FontWeight.w100,
                             )),

                             Text("Prendre contacte avec le  ",style: TextStyle(
                               color: Colors.white,
                               fontSize: 20,
                               fontWeight: FontWeight.w100,
                             )),
                             Text("service client ",style: TextStyle(
                               color: Colors.white,
                               fontSize: 20,
                               fontWeight: FontWeight.w100,
                             )),
                           ],
                         ),
                       ),


                    Container(
                      child: Icon(Icons.mark_unread_chat_alt_rounded, size: 30, color: Colors.white,),
                    )


                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 50,
            ),


            Container(
              height: 250,
              width: double.infinity,
                clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/service1.jpg",
                    fit: BoxFit.cover, // Adapte l'image pour couvrir toute la page
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                  ),
                ],
              )
            ),

          ],
        ),
      )
    );
  }

  Padding Services(BuildContext context) {
    return Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 400, // Hauteur de la liste
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    10,
                        (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 310,
                          height: 400,// Largeur de chaque élément
                          margin: const EdgeInsets.only(right: 8.0),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(50),
                          ),
                          // Couleur différente pour chaque élément
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/image1.jpg",
                                fit: BoxFit.cover, // Adapte l'image pour couvrir toute la page
                                width: double.infinity,
                                height: double.infinity,
                                alignment: Alignment.center,
                              ),


                              Positioned(
                                top: 280,
                                child: Container(
                                  width: 310,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(

                                    children: [

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              
                                              //categoti
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 20),
                                                decoration: BoxDecoration(
                                                  color: Colors.blueAccent,
                                                  borderRadius: BorderRadius.circular(5)
                                                ),
                                                child: Text("Category", 
                                                  style: TextStyle(color: Colors.white, 
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w100),),
                                              ),
                                              
                                              Text("Alou Kossivi", style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                  color: Colors.white
                                              ),
                                              ),

                                              Text("Service name", style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: Colors.blueAccent[200]
                                              ),
                                              ),
                                            ],
                                          ),

                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pushReplacement(FadeRoute(page: DetailView()));

                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.blueAccent,
                                                borderRadius: BorderRadius.circular(10),

                                              ),
                                              child: Icon(Icons.book, color: Colors.white, size: 30,)
                                            ),
                                          )
                                        ],
                                      )



                                    ],
                                  ),
                                ),
                              ),

                            ],
                          )
                        ),
                      ],
                    )
                ),
              ),
            ),
          );
  }

  Padding ServiceShimmer() {
    return Padding(
            padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 310,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
              ],)),
            ),
          ),
          );
  }
}


// Liste des services réels
Widget _buildServiceList() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 10,
    itemBuilder: (context, index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 310,
            height: 400, // Largeur de chaque élément
            margin: const EdgeInsets.only(right: 8.0),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/image1.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                ),
                Positioned(
                  top: 280,
                  child: Container(
                    width: 310,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Category",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                                Text(
                                  "Alou Kossivi",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Service name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.blueAccent[200]),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // Rediriger vers une page de détails par exemple
                                // Navigator.of(context).pushReplacement(...);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.book,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

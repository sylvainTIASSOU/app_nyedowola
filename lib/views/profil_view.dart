import 'package:flutter/material.dart';
import 'package:nyedowola/views/tabs_view.dart';

import '../components/leading_component.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({super.key});

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingComponent(page: TabsView()),
        title: Text("Profil"),
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Forme ronde
                  border: Border.all(color: Colors.blue, width: 0),
                ),
                child: Image.asset("assets/images/profil.png"),
              ),

              Form(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      //Nom input
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Nom",
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none)),
                      ),
                      SizedBox(height: 15),
                      //prnom input
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Prénom",
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none)),
                      ),

                      SizedBox(height: 15),

                      //phone input
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: "Numéro de téléphone",
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none)),
                      ),

                      SizedBox(height: 15),

                      //email inpu
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "E-Mail",
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none)),
                      ),

                      SizedBox(height: 15),



                      SizedBox(height: 15),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Mot de passe",
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none)),
                      ),

                      SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {


                          },
                          child: Text("Modifier", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                Colors.blueAccent), // Arrière-plan orange
                            shape:
                            WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // Bords bien arrondis
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  )),


            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nyedowola/components/leading_component_pop.dart';

import '../../components/input_widget.dart';
import '../../components/primary_button_widget.dart';
import '../../components/text_title_widget.dart';
import '../../utils/page_transition.dart';
import '../login_view/login_view.dart';

class Registre2View extends StatefulWidget {
  const Registre2View({super.key});

  @override
  State<Registre2View> createState() => _Registre2ViewState();
}

class _Registre2ViewState extends State<Registre2View> {
  bool type1 = false;
  bool type2 = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: LeadingComponentPop(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              TextTitleWidget(text: "Creer un compte "),
              TextTitleWidget(text: "gratutement"),
              SizedBox(height: 25),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    InputWidget(
                      label: 'Mot de passe',
                      prefix_icon: Icon(Icons.lock),
                      key_bord: TextInputType.visiblePassword,
                      obscure_text: true,
                    ),
                    SizedBox(height: 25),

                    InputWidget(
                      label: 'Confirme le Mot de passe',
                      prefix_icon: Icon(Icons.lock),
                      key_bord: TextInputType.visiblePassword,
                      obscure_text: true,
                    ),

                    SizedBox(height: 25),

                    Text("Type de compte", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600]
                    ),),


                    SizedBox(height: 10),


                    GestureDetector(
                      onTap: () {
                        setState(() {
                          type1 = !type1;
                          type2 = false;
                        });
                      },
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15),
                          border: type1 ?  Border.all(color: Colors.blue, width: 3) : null,

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/chefdeprojet.png", width: 100, height: 100,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Je suis a la recherche ", overflow: TextOverflow.clip, softWrap: true, style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue
                                ),),

                                Text(" d'un prestataire", overflow: TextOverflow.clip, softWrap: true, style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue
                                ),),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          type2 = !type2;
                          type1 = false;
                        });
                      },
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15),
                          border: type2 ?  Border.all(color: Colors.blue, width: 3) : null,

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/ouvrier.png", width: 100, height: 100),

                            Text("Je suis prestataire", style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue
                            ),),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    PrimaryButtonWidget(
                      title: 'Valider 👍',
                      action: () {
                        Navigator.of(context).pushReplacement(FadeRoute(page: LoginView()));
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

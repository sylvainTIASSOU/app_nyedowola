import 'package:flutter/material.dart';

import '../../components/text_subtext_widget.dart';

class Onboarding1View extends StatefulWidget {
  const Onboarding1View({super.key});

  @override
  State<Onboarding1View> createState() => _Onboarding1ViewState();
}

class _Onboarding1ViewState extends State<Onboarding1View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/image4.jpg", fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
          ),

          Container(

            child: Column(
              children: [
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 450,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(450),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),

                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 100,),
                      Text("Bienvenue dans",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          )
                      ),
                      Text("NyeDowola",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          )
                      ),

                      SizedBox(height: 10,),

                      Text("Découvrez la simplicité de réserver des services à  ",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      )

                      ),
                      Text("domicile en quelques clics. Que ce soit pour un ",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      )),
                      SubtitleWidget(text: "nettoyage, une réparation ou un service "),
                      Text("électrique, nous sommes là pour ",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      )),
                      Text("vous aider à chaque étape.",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      )),
                    ],
                  ),
                )
              ],
            ),

          )
        ],
      ),
    );
  }
}


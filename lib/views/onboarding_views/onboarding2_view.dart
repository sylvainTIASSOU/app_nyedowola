import 'package:flutter/material.dart';

import '../../components/text_title_widget.dart';

class Onboarding2View extends StatefulWidget {
  const Onboarding2View({super.key});

  @override
  State<Onboarding2View> createState() => _Onboarding2ViewState();
}

class _Onboarding2ViewState extends State<Onboarding2View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/image6.jpg", fit: BoxFit.cover,
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
                      TextTitleWidget(text: 'Choisissez le service',),
                      Text("dont vous avez besoin",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          )
                      ),

                      SizedBox(height: 10,),

                      Text("Sélectionnez parmi une gamme de services à ",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      )

                      ),
                      Text("domicile adaptés à vos besoins. Que vous ayez besoin  ",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      )),
                      Text("d'un nettoyage en profondeur ou d'une ",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      )),
                      Text("réparation rapide, nous avons le bon",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      )),
                      Text(" professionnel pour vous.",style: TextStyle(
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


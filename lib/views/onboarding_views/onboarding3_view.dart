import 'package:flutter/material.dart';

class Onboarding3View extends StatefulWidget {
  const Onboarding3View({super.key});

  @override
  State<Onboarding3View> createState() => _Onboarding3ViewState();
}

class _Onboarding3ViewState extends State<Onboarding3View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/image8.jpg", fit: BoxFit.cover,
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
                      Text("Réservez votre ",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          )
                      ),
                      Text("service facilement",
                          style: TextStyle(
                            fontSize: 35,
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
                      Text("Fixez une date et une heure qui vous conviennent. ",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      )),
                      Text("Notre plateforme vous garantit une expérience ",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      )),
                      Text("fluide et sécurisée, pour que vous puissiez profiter de ",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      )),
                      Text("votre temps libre sans souci.",style: TextStyle(
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

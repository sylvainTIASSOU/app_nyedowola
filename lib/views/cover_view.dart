import 'package:flutter/material.dart';
import 'package:nyedowola/views/onboarding_view.dart';

import '../utils/page_transition.dart';

class CoverView extends StatefulWidget {
  const CoverView({super.key});

  @override
  State<CoverView> createState() => _CoverViewState();
}

class _CoverViewState extends State<CoverView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (_) => const OnboardingView()
          )
      );
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/image5.jpg",
              fit: BoxFit.cover, // Adapte l'image pour couvrir toute la page
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
            ),

            Container(
              margin: EdgeInsets.only(bottom: 40),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),

                  Text("Bienvenue  🤗 👋 sur", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontFamilyFallback: ["Poppins"],
                  ),),

                  Text("NyE DoWolA ", style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontFamily: "Poppins",
                    fontFamilyFallback: ["Poppins"],
                  ),),

                  const SizedBox(height: 10,),

                  Text("Votre Solution Tout-en-Un pour", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontFamilyFallback: ["Poppins"],
                  ),),

                  Text("les Services à Domicile. ", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.italic,
                    fontFamilyFallback: ["Poppins"],
                  ),),

                  SizedBox(height: 20,),


                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(FadeRoute(page: OnboardingView()));
                    },
                    child: Container(
                      height: 45,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(
                        child: Text("Continuer",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

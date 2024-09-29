import 'package:flutter/material.dart';
import 'package:nyedowola/views/onboarding_views/onboarding1_view.dart';
import 'package:nyedowola/views/onboarding_views/onboarding2_view.dart';
import 'package:nyedowola/views/regle_politique_view/regle_politique_view.dart';
import 'package:nyedowola/views/tabs_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/page_transition.dart';
import 'onboarding_views/onboarding3_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                lastPage = (index==2);
              });
            },
            children: [
              const Onboarding1View(),
              const Onboarding2View(),
              const Onboarding3View(),
            ],
          ),



          Container(
            child: Column(
              children: [
                SizedBox(height: 35,),
                Container(

                  child: SmoothPageIndicator(controller: _controller, count: 3, effect: WormEffect( // Changez le type d'effet ici
                    dotWidth: 120.0, // Largeur des points
                    dotHeight: 8.0, // Hauteur des points
                    spacing: 20.0, // Espacement entre les points
                    activeDotColor: Colors.blueAccent, // Couleur du point actif
                    dotColor: Colors.black38, // Couleur des points inactifs
                  ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        _controller.jumpToPage(2);
                      },
                      child: const Text("Skip", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.orangeAccent,
                      ),),
                    ),

                    lastPage ?

                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(FadeRoute(page: PrivacyPolicyPage()));
                        },
                        child: const Text("Done", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blueAccent,
                        ),)
                    )

                        :

                    TextButton(
                      onPressed: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: const Text("Next", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueAccent,
                      ),)
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

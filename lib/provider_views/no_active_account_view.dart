import 'package:flutter/material.dart';
import 'package:nyedowola/provider_views/activation_views/activation_view1.dart';

import '../utils/page_transition.dart';

class NoActiveAccountView extends StatelessWidget {
  const NoActiveAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: 35,),

            Text("Vue d'ensemble", style: TextStyle(
                color: Colors.blue,
                fontSize: 45,
                fontWeight: FontWeight.bold
            ),),

            SizedBox(height: 35,),

            Image.asset("assets/images/activeacount.png"),

            SizedBox(height: 35,),

            Text("Activer votre compte pour faire partire de nos prestataire", style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w300
            ),),

            Spacer(),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(FadeRoute(page: ActivationView1()));
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text("Activer votre compte", style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nyedowola/components/input_widget.dart';
import 'package:nyedowola/components/leading_component_pop.dart';
import 'package:nyedowola/components/primary_button_widget.dart';
import 'package:nyedowola/components/text_subtext_widget.dart';
import 'package:nyedowola/components/text_title_widget.dart';
import 'package:nyedowola/views/recovery_view/recovery_view2.dart';

import '../../utils/page_transition.dart';

class RecoveryView extends StatefulWidget {
  const RecoveryView({super.key});

  @override
  State<RecoveryView> createState() => _RecoveryViewState();
}

class _RecoveryViewState extends State<RecoveryView> {
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
              TextTitleWidget(text: "Mot de passe oublié? 🤔"),
              SubtitleWidget(text: "Entre votre numero prour recuperer votre mot de passe"),

              SizedBox(height: 30,),

              Form(child: Column(children: [
                
                InputWidget(
                    label: "numéro de télépjone", 
                    prefix_icon: Icon(Icons.phone), 
                    key_bord: TextInputType.phone, 
                    obscure_text: false),
                
              ],)),

              SizedBox(height: 50,),

              PrimaryButtonWidget(title: "Continuer 👉",

                action: () {
                  Navigator.of(context).pushReplacement(FadeRoute(page: RecoveryView2(phoneNumber: "98022198",)));
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}

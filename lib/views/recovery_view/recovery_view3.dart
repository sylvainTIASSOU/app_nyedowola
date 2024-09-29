import 'package:flutter/material.dart';
import 'package:nyedowola/components/leading_component_pop.dart';

import '../../components/input_widget.dart';
import '../../components/primary_button_widget.dart';
import '../../components/text_subtext_widget.dart';
import '../../components/text_title_widget.dart';
import '../../utils/page_transition.dart';
import '../login_view/login_view.dart';

class RecoveryView3 extends StatefulWidget {
  const RecoveryView3({super.key});

  @override
  State<RecoveryView3> createState() => _RecoveryView3State();
}

class _RecoveryView3State extends State<RecoveryView3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingComponentPop(),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextTitleWidget(text: "Mot de passe oublié? 🤔"),
              SubtitleWidget(text: "Entrer un nouveau mot de passe"),

              SizedBox(height: 30,),

              InputWidget(
                label: 'Mot de passe',
                prefix_icon: Icon(Icons.lock),
                key_bord: TextInputType.visiblePassword,
                obscure_text: true,
              ),
              SizedBox(height: 30),

              InputWidget(
                label: 'Confirme le Mot de passe',
                prefix_icon: Icon(Icons.lock),
                key_bord: TextInputType.visiblePassword,
                obscure_text: true,
              ),

              SizedBox(height: 30),

              PrimaryButtonWidget(
                title: 'Valitder 👍',
                action: () {
                  Navigator.of(context).pushReplacement(FadeRoute(page: LoginView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

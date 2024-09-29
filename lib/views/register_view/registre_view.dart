import 'package:flutter/material.dart';
import 'package:nyedowola/views/login_view/login_view.dart';
import 'package:nyedowola/views/register_view/registre2_view.dart';

import '../../components/input_widget.dart';
import '../../components/leading_component_pop.dart';
import '../../components/primary_button_widget.dart';
import '../../components/text_title_widget.dart';
import '../../utils/page_transition.dart';

class RegistreView extends StatefulWidget {
  const RegistreView({super.key});

  @override
  State<RegistreView> createState() => _RegistreViewState();
}

class _RegistreViewState extends State<RegistreView> {
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
                  children: [

                    InputWidget(
                      label: 'Nom',
                      prefix_icon: Icon(Icons.person),
                      key_bord: TextInputType.text,
                      obscure_text: false,
                    ),

                    SizedBox(height: 20),

                    InputWidget(
                      label: 'Prénom',
                      prefix_icon: Icon(Icons.person),
                      key_bord: TextInputType.text,
                      obscure_text: false,
                    ),

                    SizedBox(height: 20),

                    InputWidget(
                      label: 'Numéro de téléphone',
                      prefix_icon: Icon(Icons.phone),
                      key_bord: TextInputType.phone,
                      obscure_text: false,
                    ),

                    SizedBox(height: 20),

                    InputWidget(
                      label: 'E-mail',
                      prefix_icon: Icon(Icons.mail),
                      key_bord: TextInputType.emailAddress,
                      obscure_text: false,
                    ),

                    SizedBox(height: 20),

                    InputWidget(
                      label: 'Addresse ex: quartier ville pay',
                      prefix_icon: Icon(Icons.location_on_outlined),
                      key_bord: TextInputType.text,
                      obscure_text: false,
                    ),

                    SizedBox(height: 20),

                    /*InputWidget(
                      label: 'Mot de passe',
                      prefix_icon: Icon(Icons.lock),
                      key_bord: TextInputType.visiblePassword,
                      obscure_text: true,
                    ),

                    SizedBox(height: 30),*/

                    PrimaryButtonWidget(
                      title: 'continuer 👉',
                      action: () {
                        Navigator.of(context).push(FadeRoute(page: Registre2View()));
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vous avez déjà un compte?"),

                  TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(FadeRoute(page: LoginView()));
                      },
                      child: Text("Connectez-vous", style: TextStyle(color: Colors.blueAccent),)
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

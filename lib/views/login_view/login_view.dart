import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nyedowola/components/text_title_widget.dart';
import 'package:nyedowola/controlers/login_controler.dart';
import 'package:nyedowola/views/recovery_view/recovery_view.dart';
import 'package:nyedowola/views/register_view/registre_view.dart';
import 'package:nyedowola/views/tabs_view.dart';

import '../../components/input_widget.dart';
import '../../components/primary_button_widget.dart';
import '../../utils/page_transition.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _box = Hive.box("appBox");
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              TextTitleWidget(text: "Se connecter a "),
              TextTitleWidget(text: "votre compte 😊😊"),
              SizedBox(height: 25),
              Form(
                key: _formKey,
                  child: Column(
                    children: [
                      InputWidget(
                        label: 'Numéro de téléphone',
                        prefix_icon: Icon(Icons.phone),
                        key_bord: TextInputType.phone,
                        obscure_text: false,
                        validation: LoginController.validatePhone,
                        controller: _phoneController,
                      ),

                      SizedBox(height: 20),

                      InputWidget(
                        label: 'Mot de passe',
                        prefix_icon: Icon(Icons.lock),
                        key_bord: TextInputType.visiblePassword,
                        obscure_text: true,
                        validation: LoginController.validatePassword,
                        controller: _passwordController,
                      ),

                      SizedBox(height: 30),

                      PrimaryButtonWidget(
                        title: 'Valider 👍',
                        action: () => LoginController.submitForm(_formKey, context)
                      ),
                    ],
                  ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vous n'avez pas un compte?"),

                  TextButton(
                      onPressed: (){
                        Navigator.of(context).push(FadeRoute(page: RegistreView()));
                      },
                      child: Text("creez s'en un", style: TextStyle(color: Colors.blueAccent),)
                  )
                ],
              ),

              Center(
                child: TextButton(
                    onPressed: () async {
                      await _box.put('is_connect', true);
                      Navigator.of(context).push(FadeRoute(page: RecoveryView()));
                    },
                    child: Text("Mot de passe oublier", textAlign: TextAlign.center, style: TextStyle(color: Colors.blueAccent),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}





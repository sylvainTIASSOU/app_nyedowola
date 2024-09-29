import 'package:flutter/material.dart';
import 'package:nyedowola/components/leading_component_pop.dart';
import 'package:nyedowola/components/primary_button_widget.dart';
import 'package:nyedowola/views/recovery_view/recovery_view3.dart';

import '../../components/text_subtext_widget.dart';
import '../../components/text_title_widget.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../utils/page_transition.dart';

class RecoveryView2 extends StatefulWidget {
  final String phoneNumber;
  const RecoveryView2({super.key, required this.phoneNumber});

  @override
  State<RecoveryView2> createState() => _RecoveryView2State();

}

class _RecoveryView2State extends State<RecoveryView2> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  late String number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number = widget.phoneNumber;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SubtitleWidget(text: "Un Code de verification a 4 chiffre a été envoyer sur le numéro: $number"),

              SizedBox(height: 30,),

              OtpPinField(
                maxLength: 4 ,
                otpPinFieldStyle: OtpPinFieldStyle(
                    defaultFieldBackgroundColor: Colors.white,
                    defaultFieldBorderColor: Colors.black,
                    activeFieldBorderColor: Colors.blueAccent,
                    filledFieldBackgroundColor: Colors.blueAccent,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )
                ),
                fieldWidth: 50.0,
                onSubmit: ( String pin) {
                  print ( "OTP saisi : $pin " );
                }, onChange: (String text) {  },
              ),

              SizedBox(height: 20,),
              Center(
                child: TextButton(
                    onPressed: (){

                    },
                    child: Text("Reenvoyer 🫢", textAlign: TextAlign.center, style: TextStyle(color: Colors.blueAccent),)
                ),
              ),

              SizedBox(height: 20,),

              PrimaryButtonWidget(title: "Continuer 👉", action: () {
                Navigator.of(context).pushReplacement(FadeRoute(page: RecoveryView3()));
              },),
            ],
          ),
        ),
      ),
    );
  }
}

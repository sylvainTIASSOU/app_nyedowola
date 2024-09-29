import 'package:flutter/material.dart';
import 'package:nyedowola/components/input_widget.dart';
import 'package:nyedowola/components/leading_component_pop.dart';
import 'package:nyedowola/components/secondary_button_widget.dart';
import 'package:nyedowola/components/text_title_widget.dart';
import 'package:nyedowola/provider_views/activation_views/activation_view2.dart';

import '../../utils/page_transition.dart';
class ActivationView1 extends StatefulWidget {
  const ActivationView1({super.key});

  @override
  State<ActivationView1> createState() => _ActivationView1State();
}

class _ActivationView1State extends State<ActivationView1> {
  String? selectedValue; // La valeur sélectionnée
  String? selectedValue2; // La valeur sélectionnée
  // Liste des options
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  List<String> options2 = ['Particulier', 'Entreprise / societé'];

  final TextEditingController _controller = TextEditingController();

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
              TextTitleWidget(text: "Procedure d'activation"),

              SizedBox(height: 20,),

              DropdownButtonFormField<String>(
                value: selectedValue, // La valeur sélectionnée
                decoration: InputDecoration(
                  labelText: 'Sélectionnez votre categorie',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  //prefixIcon: Icon(Icons.list), // Icône similaire au TextFormField
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none, // Pas de bordure
                  ),
                ),
                icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                style: TextStyle(color: Colors.black, fontSize: 16), // Style du texte dans la dropdown
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue; // Mettre à jour la valeur sélectionnée
                  });
                },
                items: options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              SizedBox(height: 20,),

              //selection d'un service
              Column(
                  children: [
                    Stack(
                      children: [
                        TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(
                            labelText: 'Saisir ou Sélectionner votre service',
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: _buildDropdownIcon(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              SizedBox(height: 20,),
              //date
              InputWidget(
                  label: "jours disponible exp: lundi à samedi",
                  prefix_icon: Icon(Icons.calendar_month_outlined),
                  key_bord: TextInputType.text,
                  obscure_text: false
              ),
              SizedBox(height: 20,),

              // time
              InputWidget(
                  label: "heures d'ouverture exp: 8h à 16h30",
                  prefix_icon: Icon(Icons.timer_outlined),
                  key_bord: TextInputType.text,
                  obscure_text: false
              ),

              SizedBox(height: 20,),
              //type de compte
              DropdownButtonFormField<String>(
                value: selectedValue2, // La valeur sélectionnée
                decoration: InputDecoration(
                  labelText: 'Sélectionnez le type de compte',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  //prefixIcon: Icon(Icons.list), // Icône similaire au TextFormField
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none, // Pas de bordure
                  ),
                ),
                icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                style: TextStyle(color: Colors.black, fontSize: 16), // Style du texte dans la dropdown
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue2 = newValue; // Mettre à jour la valeur sélectionnée
                  });
                },
                items: options2.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              SizedBox(height: 50,),

              SecondaryButtonWidget(title: "Continuer 👉", action: () =>Navigator.of(context).push(FadeRoute(page: ActivationView2()))
                ,)
            ],
          ),
        ),
      ),
    );
  }


// Icone du dropdown
  Widget _buildDropdownIcon() {
    return PopupMenuButton<String>(
      icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
      onSelected: (String value) {
        setState(() {
          _controller.text = value; // Mettre à jour la valeur dans le champ de texte
        });
      },
      itemBuilder: (BuildContext context) {
        return options.map((String option) {
          return PopupMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList();
      },
    );
  }

}

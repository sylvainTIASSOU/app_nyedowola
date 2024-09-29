import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nyedowola/provider_views/provider_tabs_view.dart';

import '../../components/border_dach_widget.dart';
import '../../components/leading_component_pop.dart';
import '../../components/secondary_button_widget.dart';
import '../../utils/cloudinary_image_upload.dart';
import '../../utils/page_transition.dart';
import 'package:hive/hive.dart';

class ActivationView2 extends StatefulWidget {
  const ActivationView2({super.key});

  @override
  State<ActivationView2> createState() => _ActivationView2State();
}

class _ActivationView2State extends State<ActivationView2> {
  final _box = Hive.box("appBox");

  File? _image;
  String? imageUrl;
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: LeadingComponentPop(),),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //_image != null ? Image.file(_image!) : Text('No image selected'),

              SizedBox(height: 20,),
              Text('Selectionner une image de profil', style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 25,
              ),),

              SizedBox(height: 5,),

              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100], // Forme ronde
                    borderRadius: BorderRadius.circular(20),
                    //border: Border.all(color: Colors.blue, width: 3, style: BorderStyle.solid), // Bordure bleue
                  ),
                  child: CustomPaint(
                    painter: DashedBorderPainter(),
                    child: Center(
                      child: _image != null ? Image.file(_image!, fit: BoxFit.cover,) : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Selectionner une image', style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 25,
                          ),),
                          Icon(Icons.upload_outlined, size: 45,)
                        ],
                      ),
                    )// Ajoute ton contenu ici
                  ),
                ),
              ),

              SizedBox(height: 30,),

              Text('Selectionner des images de vous en travail', style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 25,
              ),),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100], // Forme ronde
                        borderRadius: BorderRadius.circular(20),
                        //border: Border.all(color: Colors.blue, width: 3, style: BorderStyle.solid), // Bordure bleue
                      ),
                      child: CustomPaint(
                          painter: DashedBorderPainter(),
                          child: Center(
                            child: _image != null ? Image.file(_image!, fit: BoxFit.cover,) : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('upload', style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),),
                                Icon(Icons.upload_outlined, size: 45,)
                              ],
                            ),
                          )// Ajoute ton contenu ici
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100], // Forme ronde
                        borderRadius: BorderRadius.circular(20),
                        //border: Border.all(color: Colors.blue, width: 3, style: BorderStyle.solid), // Bordure bleue
                      ),
                      child: CustomPaint(
                          painter: DashedBorderPainter(),
                          child: Center(
                            child: _image != null ? Image.file(_image!, fit: BoxFit.cover,) : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('upload', style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),),
                                Icon(Icons.upload_outlined, size: 45,)
                              ],
                            ),
                          )// Ajoute ton contenu ici
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100], // Forme ronde
                        borderRadius: BorderRadius.circular(20),
                        //border: Border.all(color: Colors.blue, width: 3, style: BorderStyle.solid), // Bordure bleue
                      ),
                      child: CustomPaint(
                          painter: DashedBorderPainter(),
                          child: Center(
                            child: _image != null ? Image.file(_image!, fit: BoxFit.cover,) : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('upload', style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),),
                                Icon(Icons.upload_outlined, size: 45,)
                              ],
                            ),
                          )// Ajoute ton contenu ici
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100], // Forme ronde
                        borderRadius: BorderRadius.circular(20),
                        //border: Border.all(color: Colors.blue, width: 3, style: BorderStyle.solid), // Bordure bleue
                      ),
                      child: CustomPaint(
                          painter: DashedBorderPainter(),
                          child: Center(
                            child: _image != null ? Image.file(_image!, fit: BoxFit.cover,) : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('upload', style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),),
                                Icon(Icons.upload_outlined, size: 45,)
                              ],
                            ),
                          )// Ajoute ton contenu ici
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 50,),

              SecondaryButtonWidget(title: "Continuer 👉", action: () async {
                    await _box.put('account_active', true);

                    Navigator.of(context).pushReplacement(
                        FadeRoute(page: ProviderTabsView())

                    );
              },)
            /*  ElevatedButton(
                onPressed: () async {
                  if (_image != null) {
                    String? imageUrl = await uploadImageToCloudinary(_image!);
                    if (imageUrl != null) {
                      imageUrl = imageUrl;
                      print('Image uploaded to Cloudinary: $imageUrl');
                    }
                  }
                },
                child: Text('Upload Image'),
              ),*/

              // Text('Image URL: $imageUrl'),
            ],
          ),
        ),
      ),
    );
  }
}


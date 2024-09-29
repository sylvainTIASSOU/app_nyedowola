import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nyedowola/components/button_widget.dart';
import 'package:nyedowola/components/text_title_widget.dart';
import 'dart:io';

class BookingSheetWidget extends StatefulWidget {
  const BookingSheetWidget({super.key});

  @override
  State<BookingSheetWidget> createState() => _BookingSheetWidgetState();
}

class _BookingSheetWidgetState extends State<BookingSheetWidget> {
  DateTime? selectedDate; // Variable to hold the selected date
  TimeOfDay? selectedTime; // Variable to hold the selected time
  File? selectedImage; // Variable to hold the selected image

  final ImagePicker _picker = ImagePicker(); // Instance of ImagePicker

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked; // Update the selected date
      });
    }
  }

  // Function to show the time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked; // Update the selected time
      });
    }
  }

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // Choose from gallery or change to ImageSource.camera for camera
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path); // Update the selected image
      });
    }
  }

  // Variable to hold the description text
  String description = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 900,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Colors.white, // Background color
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextTitleWidget(text: "Programmer votre rendez-vous."),
      
            SizedBox(height: 10),
            // Display the selected date
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                height: 45,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100], // Background color
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.blue, width: 2), // Border color
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${selectedDate != null ? "${selectedDate!.toLocal()}".split(' ')[0] : "Selectionner la date"}",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.date_range, size: 30),
                  ],
                ),
              ),
            ),
      
            SizedBox(height: 10),
            // Display the selected time
            GestureDetector(
              onTap: () => _selectTime(context),
              child: Container(
                height: 45,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100], // Background color
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.blue, width: 2), // Border color
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      " ${selectedTime != null ? "${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}" : "Selectionner l'heure"}",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.timer_outlined, size: 30),
                  ],
                ),
              ),
            ),
      
            SizedBox(height: 10),
            // Image picker
            GestureDetector(
              onTap: _pickImage, // Fix: calling the function here
              child: Container(
                height: 45,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100], // Background color
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.blue, width: 2), // Border color
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Selection une image ",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.image, size: 30),
                  ],
                ),
              ),
            ),
      
            SizedBox(height: 10),          // Description input field
            Container(
              height: 45,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100], // Background color
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.blue, width: 2), // Border color
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Adresse: exp Nukafu-Lomé",
                  border: InputBorder.none,
                ),
              ),
            ),
      
            SizedBox(height: 10),
      
            // Description input field
            Container(
              height: 85,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100], // Background color
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.blue, width: 2), // Border color
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Ajouter une description",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
      
      
            // Display the selected image
            if (selectedImage != null)
              Image.file(
                selectedImage!,
                height: 100,
                width: 200,
                fit: BoxFit.cover,
              )
            else
              Text("", style: TextStyle(fontSize: 18)),
      
            //Spacer(),
            SizedBox(height: 40),
      
            // Close button
            ButtonWidget(action: () {
              Navigator.pop(context);
            },)
      
          ],
        ),
      ),
    );
  }
}

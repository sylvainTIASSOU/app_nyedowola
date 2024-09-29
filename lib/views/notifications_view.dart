import 'package:flutter/material.dart';
import 'package:nyedowola/views/tabs_view.dart';

import '../components/leading_component.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingComponent(page: TabsView()),
        title: Text("Notificatoins"),
      ),
      
      body: Center(
        child: Image.asset(
          'assets/images/cloche.gif', // Assurez-vous d'avoir le GIF dans le dossier assets/images
          width: 200,
          height: 200,
        ),
      ),

      // SingleChildScrollView(
      //   child: Container(
      //     child: Column(
      //       children: [
      //
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

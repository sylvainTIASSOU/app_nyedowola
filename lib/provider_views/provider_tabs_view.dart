import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nyedowola/provider_views/dashbord.dart';
import 'package:nyedowola/provider_views/provider_historic.dart';
import 'package:nyedowola/provider_views/provider_notification.dart';
import 'package:nyedowola/provider_views/provider_profil.dart';

class ProviderTabsView extends StatefulWidget {
  const ProviderTabsView({super.key});

  @override
  State<ProviderTabsView> createState() => _ProviderTabsViewState();
}

class _ProviderTabsViewState extends State<ProviderTabsView> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Dashbord(),
    ProviderHistoric(),
    ProviderProfil(),
    ProviderNotification()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1), // Transparence sur la couleur de fond
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  child: GNav(
                      color: Colors.black26,
                      activeColor: Colors.orangeAccent,
                      tabBackgroundColor: Colors.white.withOpacity(0.8),
                      gap: 8,
                      padding: const EdgeInsets.all(16.0),
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      tabs: [
                    GButton(
                      icon: Icons.dashboard_outlined,
                      iconSize: 35,
                      text: "Dashboard",
                    ),
                    GButton(
                      icon: Icons.history_outlined,
                      iconSize: 35,
                      text: "Historique",
                    ),
                    GButton(
                      icon: Icons.person_outline_rounded,
                      iconSize: 35,
                      text: "Profil",
                    ),
                    GButton(
                      icon: Icons.notifications_none_outlined,
                      iconSize: 35,
                      text: "Notification",
                    ),
                  ]),
                ),
              ),
          ),
        ),
      ),

      body: _pages[_selectedIndex],
    );
  }
}

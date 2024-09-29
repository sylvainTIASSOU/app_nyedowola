import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nyedowola/views/home_views/all_view.dart';
import 'package:nyedowola/views/home_views/historiques_view.dart';
import 'package:nyedowola/views/home_views/home_view.dart';
import 'package:nyedowola/views/home_views/search_view.dart';


class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeView(),
    const AllView(),
    const HistoriquesView(),

    const SearchView(),
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
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Flou sur l'arrière-plan
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
                  activeColor: Colors.blueAccent,
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
                      icon: Icons.home_outlined,
                      iconSize: 35,
                      text: "Home",
                    ),
                    GButton(
                      icon: Icons.book,
                      iconSize: 35,
                      text: "Services",
                    ),
                    GButton(
                      icon: Icons.history,
                      iconSize: 35,
                      text: "Historiques",
                    ),
                    GButton(
                      icon: Icons.search_rounded,
                      iconSize: 35,
                      text: "Recherche",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

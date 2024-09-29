import 'package:flutter/material.dart';

class HistoriquesView extends StatefulWidget {
  const HistoriquesView({super.key});

  @override
  State<HistoriquesView> createState() => _HistoriquesViewState();
}

class _HistoriquesViewState extends State<HistoriquesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nyedowola"),
      ),
      body: const Center(
        child: Text("historique"),
      ),
    );
  }
}

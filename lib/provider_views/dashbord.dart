import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nyedowola/components/text_subtext_widget.dart';
import 'package:nyedowola/components/text_title_widget.dart';
import 'package:nyedowola/provider_views/active_account_view.dart';
import 'package:nyedowola/provider_views/no_active_account_view.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  final _box = Hive.box("appBox");
   bool isActive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isActive = _box.get("account_active", defaultValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return isActive? ActiveAccountView() : NoActiveAccountView();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:nyedowola/views/cover_view.dart';
import 'package:nyedowola/views/onboarding_view.dart';
import 'package:nyedowola/views/tabs_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  final _box = Hive.box("appBox");

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () async {
      // Check if the app is launched for the first time
      bool isFirstLaunch = _box.get('isFirstLaunch', defaultValue: true);
      print(isFirstLaunch);

     if (isFirstLaunch) {
        // This is the first launch, set the flag to false
        await _box.put('isFirstLaunch', false);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const CoverView()));

      }
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const TabsView()));
    }
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
          child: Center(
              child: Image.asset(
            "assets/icons/logo3.png",
            fit: BoxFit.contain,
            width: 350,
            height: 350,
          )
              /*SvgPicture.asset(
            "assets/icons/logo3.svg",
            fit: BoxFit.contain,
            width: 200,
            height: 200,
          ),*/
              )),
    );
  }
}

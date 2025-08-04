// ignore_for_file: unused_element, unused_field, prefer_const_constructors

import 'dart:async';

import 'package:advanced_flutter_tutorial/domain/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_tutorial/domain/presentation/resources/constant_manager.dart';
import 'package:advanced_flutter_tutorial/domain/presentation/routes/route_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacement(
      context,
      RouteGenerator.getRoute(
          const RouteSettings(name: Routes.onboardingRoute)),
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

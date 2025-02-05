import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../_shared/_shared.dart';
import '../../../../core/_core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final PulsatingFadeWidgetController _animController;

  Future<void> _startApp() async {
    await Future.delayed(const Duration(seconds: 2));
    _animController.start(onEnd: _openBasePage);
  }

  Future<void> _openBasePage()async{
    await Future.delayed(const Duration(milliseconds: 500));
    Modular.to.pushReplacementNamed(AppRoutes.homeRoute);
  }

  @override
  void initState() {
    _animController = PulsatingFadeWidgetController();
    _startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: PulsatingFadeWidget(
        controller: _animController,
        duration: const Duration(seconds: 1),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/logo_white.svg',
            width: 200,
          ),
        ),
      ),
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/resources/assets_manger.dart';
import 'package:movies_app/presentation/resources/string_manger.dart';
import '../resources/color_manger.dart';
import '../resources/routes_manger.dart';
import '../resources/values_manger.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: IntegerManger.int4), _nextPage);
  }

  _nextPage() {
    Navigator.pushNamed(context, Routes.movieRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.black,
      body: Column(
        children: [
          const Image(
            image: AssetImage(
              AssetsManger.splashLogo,
            ),
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: AppSize.s100,
          ),
          Text(
            StringManger.splashText,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(StringManger.getStarted),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

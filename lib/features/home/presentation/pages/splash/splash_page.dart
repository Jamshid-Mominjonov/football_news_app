import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:football_news_app/core/route/route_names.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
      checkUser();
  }

  Future<void> checkUser() async {
    await Future.delayed(const Duration(seconds: 2));

    final user = FirebaseAuth.instance.currentUser;
      if(!mounted) return;

      if (user != null) {
        Navigator.pushReplacementNamed(context, RouteNames.homePage);
      } else {
        Navigator.pushReplacementNamed(context, RouteNames.signUpPage);
      }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Image.asset(
        'assets/images/news.png',
        height: screenHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}

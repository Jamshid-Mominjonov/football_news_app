import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/core/route/route_names.dart';
import 'package:football_news_app/features/auth/presentation/manager/riverpod.dart';
import 'package:football_news_app/features/auth/presentation/manager/sign_in/sign_in_state.dart';
import 'package:football_news_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:football_news_app/features/home/presentation/riverpod/news_provider.dart';
import '../../../domain/entities/sign_in_entity.dart';
import '../../widgets/auth_text_field.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn({required SignInEntity signInEntity}) {
    ref.read(signInNotifierProvider.notifier).signIn(signInEntity: signInEntity);
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final themeProvider = ref.watch(themeNotifierProvider);
    final authState = ref.watch(signInNotifierProvider);
    ref.listen(signInNotifierProvider, (previous, next) {
      if(next is SignInSuccess) {
        Navigator.pushReplacementNamed(context, RouteNames.homePage);
      } else if(next is SignInError) {
        ScaffoldMessenger.of(
            context,
        ).showSnackBar(SnackBar(content: Text(next.message)));
      }
    });
    return Scaffold(
      backgroundColor: themeProvider == ThemeMode.light ?  Colors.white : Color(0xFF0A0D12),
      body: Padding(padding: EdgeInsets.only(left: screenWidth * 0.050, right: screenWidth * 0.050),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: themeProvider == ThemeMode.light ?  Colors.black : Colors.white,
                ),
              ).tr(),
              SizedBox(height: screenHeight * 0.03),
              AuthTextField(controller: emailController, text: 'Email'),
              SizedBox(height: screenHeight * 0.015),
              AuthTextField(controller: passwordController, text: 'Password'),
              SizedBox(height: screenHeight * 0.003),
              GestureDetector(
                onTap: (){},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                  ).tr(),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              if(authState is SignInError) Text(authState.message),
              authState is SignInLoading
              ? Center(child: CircularProgressIndicator.adaptive())
              : AuthButton(
                  text: 'Sign in',
                  onPressed: (){
                SignInEntity signInEntity = SignInEntity(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
                signIn(signInEntity: signInEntity);
              }),
              SizedBox(height: screenHeight * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 18,
                      color: themeProvider == ThemeMode.light ? Colors.black : Colors.white,
                    ),
                  ).tr(),
                  SizedBox(width: screenWidth * 0.01),
                  GestureDetector(
                    onTap: (){Navigator.pushReplacementNamed(context, RouteNames.signUpPage);},
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ),
                    ).tr(),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}

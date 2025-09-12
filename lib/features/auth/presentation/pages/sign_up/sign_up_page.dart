import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/features/auth/presentation/manager/riverpod.dart';
import 'package:football_news_app/features/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:football_news_app/features/home/presentation/riverpod/news_provider.dart';
import '../../../../../core/route/route_names.dart';
import '../../../domain/entities/sign_up_entity.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/auth_text_field.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void signUp({required SignUpEntity signUpEntity}) {
    ref.read(signUpNotifierProvider.notifier).signUp(signUpEntity: signUpEntity);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final themeProvider = ref.watch(themeNotifierProvider);
    final authState = ref.watch(signUpNotifierProvider);
    ref.listen(signUpNotifierProvider, (previous, next) {
      if(next is SignUpSuccess) {
        Navigator.pushReplacementNamed(context, RouteNames.homePage);
      } else if(next is SignUpError) {
        ScaffoldMessenger.of(
            context,
        ).showSnackBar(SnackBar(content: Text(next.message)));
      }
    });
    return Scaffold(
      backgroundColor: themeProvider == ThemeMode.light ? Colors.white : Color(0xFF0A0D12),
       body: Padding(padding: EdgeInsets.only(top: screenHeight * 0.28, left: screenWidth * 0.050, right: screenWidth * 0.050),
       child: Column(
         children: [
           Text(
             'Create Account',
             style: TextStyle(
               fontSize: 36,
               fontWeight: FontWeight.w600,
               color: themeProvider == ThemeMode.light ? Colors.black :Colors.white,
             ),
           ).tr(),
           SizedBox(height: screenHeight * 0.03),
           AuthTextField(controller: userNameController, text: 'Name'),
           SizedBox(height: screenHeight * 0.015),
           AuthTextField(controller: emailController, text: 'Email'),
           SizedBox(height: screenHeight * 0.015),
           AuthTextField(controller: passwordController, text: 'Password'),
           SizedBox(height: screenHeight * 0.015),
           AuthTextField(controller: confirmPasswordController, text: 'Confirm password'),
           SizedBox(height: screenHeight * 0.025),
           if(authState is SignUpError)Text(authState.message),
           authState is SignUpLoading
           ? Center(child: CircularProgressIndicator.adaptive())
           : AuthButton(text: 'Sign Up', onPressed: () {
             SignUpEntity signUpEntity = SignUpEntity(
                 userNameController.text.trim(),
                 emailController.text.trim(),
                 passwordController.text.trim(),
                 confirmPasswordController.text.trim(),
             );
             signUp(signUpEntity: signUpEntity);
           },),
           SizedBox(height: screenHeight * 0.015),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(
                 'Already have an account?',
                 style: TextStyle(
                   fontSize: 17,
                   color: themeProvider == ThemeMode.light ?  Colors.black : Colors.white,
                 ),
               ).tr(),
               SizedBox(width: screenWidth * 0.01),
               GestureDetector(
                 onTap: (){Navigator.pushReplacementNamed(context, RouteNames.signInPage);},
                 child: Text(
                   'Log in',
                   style: TextStyle(
                     fontSize: 18,
                     color: Colors.blueAccent,
                   ),
                 ).tr(),
               ),
             ],
           ),
           SizedBox(height: screenHeight * 0.01),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Container(
                 height: 2,
                 width: screenWidth * 0.4,
                 color: Colors.grey[200],
               ),
               Text(
                 'Or',
                 style: TextStyle(
                   color: themeProvider == ThemeMode.light ?  Colors.black : Colors.white,
                   fontSize: 18,
                 ),
               ).tr(),
               Container(
                 height: 2,
                 width: screenWidth * 0.4,
                 color: Colors.grey[200],
               ),
             ],
           ),
           SizedBox(height: screenHeight * 0.01),
           GestureDetector(
             onTap: (){ Navigator.pushReplacementNamed(context, RouteNames.homePage);},
             child: Text(
                 'Continue without account',
               style: TextStyle(
                 fontSize: 18,
                 color: Colors.blueAccent,
               ),
             ).tr(),
           ),
         ],
       )
       ),
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pushNamed(context, RouteNames.homePage);}),
    );
  }
}



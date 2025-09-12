import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../riverpod/news_provider.dart';

class AccountPart extends ConsumerWidget {
  const AccountPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final themeProvider = ref.watch(themeNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ACCOUNT',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ).tr(),
        SizedBox(height: screenHeight * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 19,
                color:
                    themeProvider == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ).tr(),
            Image.asset('assets/images/arrow_right.png', color: Colors.grey),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Change Password',
              style: TextStyle(
                fontSize: 19,
                color: themeProvider == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ).tr(),
            Image.asset('assets/images/arrow_right.png', color: Colors.grey),
          ],
        ),
      ],
    );
  }
}

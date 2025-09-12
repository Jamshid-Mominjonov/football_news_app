import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../riverpod/news_provider.dart';

class NotificationsPart extends ConsumerStatefulWidget {
  const NotificationsPart({super.key});

  @override
  ConsumerState<NotificationsPart> createState() => _NotificationsPartState();
}

class _NotificationsPartState extends ConsumerState<NotificationsPart> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final themeProvider = ref.watch(themeNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NOTIFICATIONS',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ).tr(),
        SizedBox(height: screenHeight * 0.002),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Push Notifications',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: themeProvider == ThemeMode.light ? Colors.black :Colors.white,
                fontSize: 19,
              ),
            ).tr(),
            Transform.scale(
              scale: 0.8,
              child: Switch(
                activeTrackColor: Colors.blue,
                activeColor: Colors.white,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.002),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'About app',
              style: TextStyle(
                fontSize: 19,
                color: themeProvider == ThemeMode.light ? Colors.black :Colors.white,
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
            Expanded(
              child: Text(
                'Privacy policy',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 19,
                  color: themeProvider == ThemeMode.light ? Colors.black :Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ).tr(),
            ),
            Image.asset('assets/images/arrow_right.png', color: Colors.grey),
          ],
        ),
      ],
    );
  }
}

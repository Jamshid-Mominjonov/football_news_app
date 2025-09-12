import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../riverpod/news_provider.dart';

class AppearancePart extends ConsumerStatefulWidget {
  const AppearancePart({super.key});

  @override
  ConsumerState<AppearancePart> createState() => _AppearancePartState();
}

class _AppearancePartState extends ConsumerState<AppearancePart> {
  bool uz = false;
  bool ru = false;
  bool en = false;
  void uzTap() {
    setState(() {
      uz = !uz;
    });
  }

  void ruTap() {
    setState(() {
      ru = !ru;
    });
  }

  void enTap() {
    setState(() {
      en = !en;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final themeProvider = ref.watch(themeNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'APPEARANCE',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ).tr(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dark mode',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color:
                    themeProvider == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
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
                value: themeProvider == ThemeMode.dark,
                onChanged: (value) {
                  ref.read(themeNotifierProvider.notifier).changeTheme();
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
              'Font Size',
              style: TextStyle(
                fontSize: 19,
                color: themeProvider == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ).tr(),
            Text(
              'Medium',
              style: TextStyle(
                fontSize: 19,
                color: themeProvider == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
              ),
            ).tr(),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Row(
          children: [
            Text(
              'Language',
              style: TextStyle(
                fontSize: 19,
                color: themeProvider == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ).tr(),
            Spacer(),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: themeProvider == ThemeMode.light
                          ? Colors.white
                          : Color(0xFF0A0D12),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            height: 3,
                            width: screenWidth * 0.07,
                            color: Colors.grey,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            'Select language',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: themeProvider == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  enTap();
                                   context.setLocale(Locale('en', 'US'));
                                },
                                child: Image.asset(
                                  en
                                      ? 'assets/images/radio_button.png'
                                      : 'assets/images/round.png',
                                  color:
                                  themeProvider == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                "English",
                                style: TextStyle(
                                  fontSize: 19,
                                  color:
                                  themeProvider == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  uzTap();
                                  context.setLocale(Locale('uz', 'UZ'));
                                },
                                child: Image.asset(
                                  uz
                                      ? 'assets/images/radio_button.png'
                                      : 'assets/images/round.png',
                                  color: themeProvider == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                "O'zbek",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: themeProvider == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ruTap();
                                     context.setLocale(Locale('ru', 'RU'));
                                },
                                child: Image.asset(
                                  ru
                                      ? 'assets/images/radio_button.png'
                                      : 'assets/images/round.png',
                                  color: themeProvider == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                "Русский",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: themeProvider == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Image.asset(
                'assets/images/arrow_right.png',
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

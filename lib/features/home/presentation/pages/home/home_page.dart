import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/core/route/route_names.dart';
import 'package:football_news_app/features/auth/presentation/manager/riverpod.dart';
import 'package:football_news_app/features/home/presentation/riverpod/news/news_state.dart';
import 'package:football_news_app/features/home/presentation/riverpod/news_provider.dart';
import 'package:football_news_app/features/home/presentation/widgets/home/img_title.dart';
import '../../widgets/drawer/account_part.dart';
import '../../widgets/drawer/appearance_part.dart';
import '../../widgets/drawer/notifications_part.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(newsNotifierProvider.notifier).getNews();
    });
  }
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final authState = ref.watch(authStateProvider);
    final newsState = ref.watch(newsNotifierProvider);
    final themeProvider = ref.watch(themeNotifierProvider);
    return Scaffold(backgroundColor: themeProvider == ThemeMode.light ? Colors.white : Color(0xFF0A0D12),
    appBar: AppBar(
      actionsPadding: EdgeInsets.only(right: screenWidth * 0.02),
        backgroundColor: themeProvider == ThemeMode.light ? Colors.white : Color(0xFF0A0D12),
      actions: [
        IconButton(
            onPressed: (){Navigator.pushNamed(context, RouteNames.favouritesPage,
             );
              },
            icon: Icon(Icons.favorite_border,
              size: screenHeight * 0.03,
              color: themeProvider == ThemeMode.light ? Colors.black :Colors.white
            ),
        ),
      ],
    ),
      drawer: Drawer(
        width: screenWidth * 0.75,
        child: authState.when(
          data: (user) {
            if (user == null) {
              return Padding(
                padding:  EdgeInsets.only(top: screenHeight * 0.1),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/user.png',
                      color: Colors.black,
                      height: screenHeight * 0.1,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                        'Not signed in',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    GestureDetector(
                      onTap: (){Navigator.pushReplacementNamed(context, RouteNames.signUpPage);},
                      child: Text(
                          'Register',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(color: Color(0xFF0A0D12)),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.07,
                      right: screenWidth * 0.1,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/user.png',
                          color: Colors.white,
                          height: screenHeight * 0.1,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          '${user.displayName}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: screenHeight,
                    decoration: BoxDecoration(
                      color: themeProvider == ThemeMode.light ? Colors.white :Color(0xFF0A0D12),
                    ),
                    padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.04, right: screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.01),
                        AccountPart(),
                        SizedBox(height: screenHeight * 0.02),
                        Container(
                          height: 2,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        AppearancePart(),
                        SizedBox(height: screenHeight * 0.02),
                        Container(
                          height: 2,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        NotificationsPart(),
                        context.locale == (Locale('ru', 'RU'))
                            ? SizedBox(height: screenHeight * 0.16)
                            : SizedBox(height: screenHeight * 0.19),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              ref.read(signOutNotifierProvider.notifier).signOut();
                              Navigator.pushNamed(context, RouteNames.signInPage);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout, color: Colors.red),
                                SizedBox(width: screenWidth * 0.01),
                                Text(
                                  'Sign out',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                    fontSize: 22,
                                  ),
                                ).tr(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text("Error: $err")),
        ),
      ),
      body:
      newsState is NewsSuccess
              ? ListView.builder(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.01,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05,
                  bottom: screenHeight * 0.01,
                ),
                itemCount: newsState.newsEntity.length,
                itemBuilder: (context, index) {
                  return
                  ImgTitle(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RouteNames.webViewPage,
                        arguments: newsState.newsEntity[index].originalUrl,
                      );
                    },
                    image: newsState.newsEntity[index].image ?? '',
                    title: newsState.newsEntity[index].title ?? '',
                    originalUrl: newsState.newsEntity[index].originalUrl ?? '',
                    index:newsState.newsEntity[index].id ?? 0,
                  );
                },
              )
              : newsState is NewsLoading
              ? Center(child: CircularProgressIndicator.adaptive())
              : newsState is NewsError
              ? Text(newsState.message)
              : SizedBox(),
    );
  }
}




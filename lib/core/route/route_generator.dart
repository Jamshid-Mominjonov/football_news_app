import 'package:flutter/material.dart';
import 'package:football_news_app/core/route/route_names.dart';
import '../../views/pages/auth/sign_in_page.dart';
import '../../views/pages/auth/sign_up_page.dart';
import '../../views/pages/home/favourites/favourites_page.dart';
import '../../views/pages/home/home/home_page.dart';
import '../../views/pages/home/splash/splash_page.dart';
import '../../views/pages/home/web_view/web_view_page.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteNames.signUpPage:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case RouteNames.signInPage:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case RouteNames.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteNames.favouritesPage:
        return MaterialPageRoute(builder: (_) => const FavouritesPage());
      case RouteNames.webViewPage:
        final args = routeSettings.arguments;
        if (args == null) {
          return _errorRoute();
        }
        final url = args.toString();
        return MaterialPageRoute(builder: (_) => WebViewPage(url));
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("Page not found")),
      ),
    );
  }
}

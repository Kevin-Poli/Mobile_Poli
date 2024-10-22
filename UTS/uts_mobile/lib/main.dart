// lib/main.dart
import 'package:flutter/material.dart';
import 'package:uts_mobile/screens/landing_page.dart';
import 'package:uts_mobile/screens/login_page.dart';
import 'package:uts_mobile/screens/home_page.dart';
import 'package:uts_mobile/screens/about_page.dart';
import 'package:uts_mobile/screens/profile_page.dart';
import 'package:uts_mobile/utils/constants.dart';
import 'package:uts_mobile/themes/app_theme.dart';
import 'package:uts_mobile/models/user_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserModel defaultUser = UserModel(
    username: Constants.ADMIN_USERNAME,
    role: 'Demo User'
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      
      initialRoute: Constants.ROUTE_LANDING,
      
      routes: {
        Constants.ROUTE_LANDING: (context) => LandingPage(),
        Constants.ROUTE_LOGIN: (context) => LoginPage(),
        Constants.ROUTE_HOME: (context) => HomePage(),
        Constants.ROUTE_ABOUT: (context) => AboutPage(),
        Constants.ROUTE_PROFILE: (context) => ProfilePage(),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(Constants.MSG_PAGE_NOT_FOUND),
            ),
          ),
        );
      },

      navigatorObservers: [
        MyRouteObserver(),
      ],
    );
  }
}

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    print('Navigated to: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    print('Navigated back from: ${route.settings.name}');
  }
}

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  CustomPageRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
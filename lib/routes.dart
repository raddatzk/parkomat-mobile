import 'package:flutter/material.dart' show Animation, BuildContext, FadeTransition, Localizations, Navigator, PageRouteBuilder, Text;
import 'package:flutter_whatsnew/flutter_whatsnew.dart' show WhatsNewPage;
import 'package:parkomat/bloc/home/home_bloc.dart' show HomeBloc, RefreshEvent;
import 'package:parkomat/generated/l10n.dart' show S;
import 'package:parkomat/main.dart' show sl;
import 'package:parkomat/ui/home/home.dart' show HomeScreen;
import 'package:parkomat/ui/settings/settings.dart' show SettingsScreen;

typedef PageRouteBuilder PageRouteBuilderBuilder();

class RouteBuilder {
  RouteBuilder._();

  static Routes currentRoute;

  static final routes = <Routes, PageRouteBuilderBuilder>{
    Routes.home: () => PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) => HomeScreen(),
          transitionsBuilder: (context, animation, _, child) => FadeTransition(opacity: animation, child: child),
        ),
    Routes.settings: () => PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) => SettingsScreen(),
          transitionsBuilder: (context, animation, _, child) => FadeTransition(opacity: animation, child: child),
        ),
    Routes.changelog: () {
      return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
          String locale = S.delegate.isSupported(Localizations.localeOf(context)) ? Localizations.localeOf(context).languageCode : "en";

          return WhatsNewPage.changelog(
            title: Text(S.of(context).changelog),
            buttonText: Text(S.of(context).changelogGoBack),
            path: "documentation/changelog_$locale.md",
            onButtonPressed: () {
              sl<HomeBloc>().add(RefreshEvent());
              Navigator.pop(context);
            },
          );
        },
        transitionsBuilder: (context, animation, _, child) => FadeTransition(opacity: animation, child: child),
      );
    },
  };

  static PageRouteBuilder build(Routes route) {
    currentRoute = route;
    return routes[route]();
  }
}

enum Routes {
  home,
  settings,
  changelog,
}

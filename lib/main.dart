import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:inject/inject.dart';
import 'package:parkomat/di/modules/parkomat_module.dart';
import 'package:parkomat/generated/i18n.dart';

import 'di/components/app_component.dart';
import 'ui/home/home.dart';

// global instance for app component
// TODO find out a better way to use it across application
var appComponent;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appComponent = await AppComponent.create(ParkomatModule());

  runApp(appComponent.app);
}

@provide
class ParkomatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Parkomat",
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: S.delegate.resolution(fallback: new Locale("en", "")),
      theme: ThemeData(
        brightness: Brightness.dark,
        toggleableActiveColor: Colors.limeAccent,
        accentColor: Colors.limeAccent,
      ),
      home: HomeScreen(),
    );
  }
}

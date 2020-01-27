import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Brightness;
import 'package:flutter_localizations/flutter_localizations.dart' show GlobalCupertinoLocalizations, GlobalMaterialLocalizations, GlobalWidgetsLocalizations;
import 'package:get_it/get_it.dart' show GetIt;
import 'package:parkomat/di/di.dart' show prepareDi;
import 'package:parkomat/generated/l10n.dart' show S;
import 'package:parkomat/generated/l10n_extension.dart';
import 'package:parkomat/ui/home/home.dart' show HomeScreen;

GetIt sl = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prepareDi();
  runApp(ParkomatApp());
}

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
      localeResolutionCallback: S.delegate.resolution(fallback: Locale("en", "")),
      theme: ThemeData(
        brightness: Brightness.dark,
        toggleableActiveColor: Colors.limeAccent,
        accentColor: Colors.limeAccent,
      ),
      home: HomeScreen(),
    );
  }
}

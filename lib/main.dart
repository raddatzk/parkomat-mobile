import 'package:connectivity/connectivity.dart' show Connectivity, ConnectivityResult;
import 'package:connectivity_wrapper/connectivity_wrapper.dart' show ConnectivityAppWrapper;
import 'package:flushbar/flushbar.dart' show Flushbar;
import 'package:flutter/material.dart' show Brightness, BuildContext, Colors, Icon, Icons, Locale, MaterialApp, Navigator, State, StatefulWidget, StatelessWidget, ThemeData, Widget, WidgetsBinding, WidgetsFlutterBinding, runApp;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener;
import 'package:flutter_localizations/flutter_localizations.dart' show GlobalCupertinoLocalizations, GlobalMaterialLocalizations, GlobalWidgetsLocalizations;
import 'package:get_it/get_it.dart' show GetIt;
import 'package:parkomat/bloc/main/main_bloc.dart' show CheckConnection, InitializeAppEvent, MainBloc, MainState, SetBaseUrl, ShowChangelog;
import 'package:parkomat/di/di.dart' show prepareDi;
import 'package:parkomat/generated/l10n.dart' show S;
import 'package:parkomat/generated/l10n_extension.dart';
import 'package:parkomat/routes.dart' show RouteBuilder, Routes;
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
    return ConnectivityAppWrapper(
      app: MaterialApp(
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
        home: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  final MainBloc _bloc = sl<MainBloc>();

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._bloc.add(InitializeAppEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, MainState>(
      bloc: widget._bloc,
      listener: (context, state) async {
        var connectivityResult = await (Connectivity().checkConnectivity());

        if (state is ShowChangelog) {
          Navigator.push(context, RouteBuilder.build(Routes.changelog));
        } else if (state is SetBaseUrl) {
          Navigator.pushReplacement(context, RouteBuilder.build(Routes.settings));
        } else if (state is CheckConnection && connectivityResult != ConnectivityResult.none) {
          Flushbar(
            message: S.of(context).checkConnection,
            backgroundColor: Colors.red[300],
            icon: Icon(Icons.error),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      },
      child: HomeScreen(),
    );
  }
}

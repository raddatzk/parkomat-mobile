import 'dart:io';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkomat/bloc/main/main_bloc.dart';
import 'package:parkomat/generated/i18n.dart';
import 'package:parkomat/main.dart';
import 'package:parkomat/routes.dart';
import 'package:parkomat/widget/connectivity_indicator.dart';
import 'package:parkomat/widget/parkomat_body.dart';
import 'package:parkomat/widget/parkomat_footer.dart';
import 'package:parkomat/widget/parkomat_header.dart';
import 'package:parkomat/widget/share_button.dart';

class HomeScreen extends StatefulWidget {
  final MainBloc _bloc = appComponent.mainBloc;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectivityIndicator(
        child: RefreshIndicator(
          onRefresh: () async => widget._bloc.add(RefreshMainEvent()),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: BlocListener<MainBloc, MainState>(
                bloc: widget._bloc,
                listener: (context, state) {
                  if (state is Error404MainState) {
                    Flushbar(
                      message: S.of(context).couldNotGetStats,
                      backgroundColor: Colors.red,
                      icon: Icon(Icons.error),
                      duration: Duration(seconds: 3),
                    )..show(context);
                  }
                  if (state is OutdatedVersionMainState) {
                    Flushbar flush;
                    flush = Flushbar(
                      message: S.of(context).outdatedVersion(state.version),
                      backgroundColor: Colors.orange,
                      icon: Icon(Icons.warning),
                      isDismissible: true,
                      mainButton: (Platform.isAndroid)
                          ? FlatButton(
                              onPressed: () {
                                widget._bloc.add(UpdateApkMainEvent());
                                flush.dismiss();
                              },
                              child: Icon(Icons.file_download),
                            )
                          : null,
                    )..show(context);
                  }
                  if (state is UnsetMainState) {
                    Navigator.pushReplacement(context, RouteBuilder.build(context, Routes.settings));
                  }
                  if (state is ShowChangelogMainState) {
                    Flushbar(
                      backgroundColor: Color.fromARGB(255, 69, 69, 69),
                      message: state.releaseNotes,
                      icon: Icon(Icons.new_releases),
                      isDismissible: true,
                    )..show(context);
                  }
                },
                child: BlocBuilder<MainBloc, MainState>(
                  bloc: widget._bloc,
                  builder: (context, state) => Stack(
                    children: <Widget>[
                      ShareButton(state),
                      Column(
                        children: <Widget>[
                          ParkomatHeader(),
                          ParkomatBody(state),
                          Expanded(child: Container()),
                          ParkomatFooter(state),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, RouteBuilder.build(context, Routes.settings)),
        child: Icon(Icons.settings),
      ),
    );
  }

  @override
  void dispose() {
    widget._bloc.close();
    super.dispose();
  }
}

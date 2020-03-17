import 'package:connectivity/connectivity.dart' show Connectivity, ConnectivityResult;
import 'package:flushbar/flushbar.dart' show Flushbar;
import 'package:flutter/material.dart' show BuildContext, Colors, Column, Container, Expanded, FloatingActionButton, Icon, Icons, Navigator, RefreshIndicator, Scaffold, Stack, State, StatefulWidget, Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener;
import 'package:parkomat/bloc/home/home_bloc.dart' show CheckConnection, HomeBloc, HomeState, RefreshEvent;
import 'package:parkomat/generated/l10n.dart' show S;
import 'package:parkomat/main.dart' show sl;
import 'package:parkomat/routes.dart' show RouteBuilder, Routes;
import 'package:parkomat/widget/connectivity_widget/connectivity_widget.dart' show ConnectivityWidget;
import 'package:parkomat/widget/parkomat_body/parkomat_body.dart' show ParkomatBody;
import 'package:parkomat/widget/parkomat_footer/parkomat_footer.dart' show ParkomatFooter;
import 'package:parkomat/widget/parkomat_header/parkomat_header.dart' show ParkomatHeader;
import 'package:parkomat/widget/scrollable_container/scrollable_container.dart' show ScrollableContainer;
import 'package:parkomat/widget/share_button/share_button.dart' show ShareButton;

class HomeScreen extends StatefulWidget {
  final HomeBloc _bloc = sl<HomeBloc>();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectivityWidget(
        child: RefreshIndicator(
          onRefresh: () async {
            widget._bloc.add(RefreshEvent());
          },
          child: ScrollableContainer(
            child: BlocListener<HomeBloc, HomeState>(
              bloc: widget._bloc,
              listener: (context, state) async {
                var connectivityResult = await (Connectivity().checkConnectivity());
                if (state is CheckConnection && connectivityResult != ConnectivityResult.none) {
                  Flushbar(
                    message: S.of(context).checkConnection,
                    backgroundColor: Colors.red[300],
                    icon: Icon(Icons.error),
                    duration: Duration(seconds: 3),
                  )..show(context);
                }
              },
              child: Stack(
                children: <Widget>[
                  ShareButton(),
                  Column(
                    children: <Widget>[
                      ParkomatHeader(),
                      ParkomatBody(),
                      Expanded(child: Container()),
                      ParkomatFooter(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, RouteBuilder.build(Routes.settings)),
        child: Icon(Icons.settings),
      ),
    );
  }
}

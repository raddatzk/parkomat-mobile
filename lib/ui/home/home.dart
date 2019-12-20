import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkomat/bloc/main/main_bloc.dart';
import 'package:parkomat/main.dart';
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
          onRefresh: () async => widget._bloc.add(RefreshMainEvent(context)),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<MainBloc, MainState>(
                bloc: widget._bloc,
                builder: (context, state) {
                  if (state is UnsetMainState) {
                    widget._bloc.add(SetBaseUrlMainEvent(context, true));
                  }
                  if (state is LoadedMainState) {
                    return Stack(
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
                    );
                  }
                  if (state is Error404MainState) {
                    widget._bloc.add(Error404MainEvent(context));
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget._bloc.add(SetBaseUrlMainEvent(context, false)),
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

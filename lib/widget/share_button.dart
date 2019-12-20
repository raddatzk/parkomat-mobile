import 'package:flutter/material.dart';
import 'package:parkomat/bloc/main/main_bloc.dart';
import 'package:parkomat/generated/i18n.dart';
import 'package:parkomat/util/stats_utils.dart';
import 'package:share/share.dart';

class ShareButton extends StatelessWidget {
  final MainState _mainState;

  const ShareButton(this._mainState, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      right: 5,
      child: IconButton(
        onPressed: (_mainState is LoadedMainState)
            ? () {
                String subject = statsShareTitle((_mainState as LoadedMainState).stats, context) + " " + statsDescription((_mainState as LoadedMainState).stats, context) + S.of(context).yourParkomat;
                RenderBox box = context.findRenderObject();
                Share.share(subject, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
              }
            : () {},
        icon: Icon(Icons.share),
      ),
    );
  }
}

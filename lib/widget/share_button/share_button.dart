import 'package:flutter/material.dart';
import 'package:parkomat/bloc/main/main_bloc.dart' show LoadedMainState, MainState;
import 'package:parkomat/models/parkomat/free_spot_statistics.dart' show FreeSpotStatistics;
import 'package:parkomat/util/stats_utils/stats_utils.dart' show shareMessageGreeting, statsDetails, statsSummary;
import 'package:share/share.dart' show Share;

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
                FreeSpotStatistics stats = (_mainState as LoadedMainState).stats;
                String subject = statsSummary(stats, context) + statsDetails(stats, context) + shareMessageGreeting(context);
                RenderBox box = context.findRenderObject();
                Share.share(subject, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
              }
            : () {},
        icon: Icon(Icons.share),
      ),
    );
  }
}

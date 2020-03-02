import 'package:flutter/material.dart' show BuildContext, Icon, IconButton, Icons, MediaQuery, Offset, Positioned, RenderBox, State, StatefulWidget, Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener;
import 'package:parkomat/bloc/home/home_bloc.dart' show HomeBloc, HomeState, ShowStats;
import 'package:parkomat/main.dart' show sl;
import 'package:parkomat/models/parkomat/free_spot_statistics.dart' show FreeSpotStatistics;
import 'package:parkomat/util/stats_utils/stats_utils.dart' show shareMessageGreeting, statsDetails, statsSummary;
import 'package:share/share.dart' show Share;

class ShareButton extends StatefulWidget {
  final HomeBloc _bloc = sl<HomeBloc>();

  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  FreeSpotStatistics _stats;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      bloc: widget._bloc,
      listener: (context, state) {
        if (state is ShowStats) {
          _stats = state.stats;
        }
      },
      child: Positioned(
        top: MediaQuery.of(context).padding.top,
        right: 5,
        child: IconButton(
          onPressed: (_stats != null)
              ? () {
                  FreeSpotStatistics stats = _stats;
                  String subject = statsSummary(stats, context) + statsDetails(stats, context) + shareMessageGreeting(context);
                  RenderBox box = context.findRenderObject();
                  Share.share(subject, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
                }
              : () {},
          icon: Icon(Icons.share),
        ),
      ),
    );
  }
}

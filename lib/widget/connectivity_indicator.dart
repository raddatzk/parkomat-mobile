import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class ConnectivityIndicator extends StatelessWidget {
  final Widget child;

  const ConnectivityIndicator({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
        connectivityBuilder: (context, connectivity, child) {
          final bool connected = connectivity != ConnectivityResult.none;
          return connected
              ? child
              : Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      height: 32.0,
                      left: 0.0,
                      top: MediaQuery.of(context).padding.top,
                      right: 0.0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 350),
                        color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          child: connected
                              ? Text('ONLINE')
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('OFFLINE'),
                                    SizedBox(width: 8.0),
                                    SizedBox(
                                      width: 12.0,
                                      height: 12.0,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.0,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    child,
                  ],
                );
        },
        child: child);
  }
}

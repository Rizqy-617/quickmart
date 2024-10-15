import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:quickmart/store/config/app_state.dart';
import 'package:quickmart/template/route.dart';
import 'package:quickmart/utils/route_observer.dart';
import 'package:redux/redux.dart';

class ReduxApp extends StatefulWidget {
  final Store<AppState> store;
  const ReduxApp({super.key, required this.store});

  @override
  State<ReduxApp> createState() => _ReduxAppState();
}

class _ReduxAppState extends State<ReduxApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: widget.store,
      child: MaterialApp(
        builder: FlutterSmartDialog.init(),
        navigatorObservers: [
          CustomRouteObserver(),
          FlutterSmartDialog.observer
        ],
        routes: route,
        initialRoute: "/",
      ),
      
    );
  }
}
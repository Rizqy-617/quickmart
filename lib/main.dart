import 'package:flutter/material.dart';
import 'package:quickmart/app.dart';
import 'package:quickmart/store/config/store_config.dart';
import 'package:quickmart/store/models/app_state.dart';
import 'package:redux/redux.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Store<AppState> store = await StoreConfig.instance.getStore();
  runApp(ReduxApp(
    store: store,
  ));
}
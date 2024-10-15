import 'package:flutter/material.dart';
import 'package:quickmart/app.dart';
import 'package:quickmart/store/config/store_config.dart';
import 'package:quickmart/store/reducers/reducer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  store = await StoreConfig.instance.getStore();
  runApp(ReduxApp(
    store: store!,
  ));
}
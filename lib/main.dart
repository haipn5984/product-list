import 'package:flutter/material.dart';
import 'package:product_list/handle_app.dart';
import 'package:product_list/init_app.dart';

Future<void> main() async {
  await initApp();
  runApp(const HandleApp());
  configLoading();
}

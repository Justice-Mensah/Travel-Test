import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:traveling/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(MyApp());
}

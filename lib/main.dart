import 'package:flutter/material.dart';
import './app.dart';
import 'locale/initialize_i18n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> localizedValues = await initializeI18n();
  runApp(App(localizedValues));
}

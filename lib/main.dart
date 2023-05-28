import 'package:flutter/material.dart';
import 'package:hive_clean_arch/app/app.dart';

import 'app/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(
    const App(),
  );
}

import 'package:flutter/material.dart';

import 'AppConfig/app_config.dart';
import 'Routes/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookApp',
      theme: AppTheme.lightThemeData,
      initialRoute: 'splash',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routers.generateRoute,
    );
  }
}

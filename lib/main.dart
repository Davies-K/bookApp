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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}

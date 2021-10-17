import 'package:book_app/Providers/book_list_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppConfig/app_config.dart';
import 'Providers/auth_providers.dart';
import 'Providers/favorite_list_provider.dart';
import 'Routes/routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
          initialData: null,
        ),
        ChangeNotifierProvider(
            create: (BuildContext context) => BookListProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => FavouriteListProvider())
      ],
      child: MaterialApp(
        title: 'BookApp',
        theme: AppTheme.lightThemeData,
        initialRoute: 'splash',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}

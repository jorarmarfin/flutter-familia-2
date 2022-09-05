import 'package:flutter/material.dart';
import 'package:flutter_familia/providers/providers.dart';
import 'package:flutter_familia/theme/mytheme.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => DrupalProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => LoginProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => FireBaseProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: MyTheme.base,
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (context) => const HomeScreen(),
        LoginScreen.routerName: (context) => const LoginScreen(),
        DetalleMiembroScreen.routerName: (context) => const DetalleMiembroScreen(),
        DetalleArchivoScreen.routerName: (context) => const DetalleArchivoScreen(),
      },
    );
  }
}

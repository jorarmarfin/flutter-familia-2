import 'package:flutter/material.dart';
import 'package:flutter_familia/providers/providers.dart';
import 'package:flutter_familia/route/app_routes.dart';
import 'package:flutter_familia/theme/mytheme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => DrupalProvider())
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
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        onGenerateRoute: AppRoutes.onGenerateRoute
        //Cuando es la misma variable que envias a la que recibes, se pude moitir y enviar por referencia
        );
  }
}

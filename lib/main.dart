import 'package:amzon_clone/constants/global_var.dart';
import 'package:amzon_clone/feature/auth/auth_screen.dart';
import 'package:amzon_clone/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Amazone Clone',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariable.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariable.secondaryColor),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.red),
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: AuthScreen());
  }
}

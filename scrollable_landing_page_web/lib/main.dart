

import 'package:flutter/material.dart';
import 'package:scrollable_landing_page_web/providers/page_provider.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_landing_page_web/router/router.dart';

void main() => runApp( AppState());

  class AppState extends StatelessWidget {
    const AppState({super.key});
  
    @override
    Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider( create: (_)=> PageProvider() )
        ],
        child: const MyApp(),
      );
    }
  }


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Flurorouter.configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing Page',
      initialRoute: '/about',
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}
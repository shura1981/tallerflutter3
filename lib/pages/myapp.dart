import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/route.dart';

import '../providers/userprovider.dart';
import '../themes/basic_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo3',
        debugShowCheckedModeBanner: false,
        theme: AppBasicTheme.lightTheme,
        darkTheme: AppBasicTheme.darkTheme,
        routes: AppRoute.routes(),
        initialRoute: AppRoute.initial,
      ),
    );
  }
}

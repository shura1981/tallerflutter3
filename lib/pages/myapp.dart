import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/settings.dart';
import '../providers/persistence.dart';
import '../providers/themeprovider.dart';
import '../routes/route.dart';

import '../providers/userprovider.dart';
import '../themes/basic_theme.dart';

Future getState(seconds) => Future.delayed(Duration(seconds: seconds));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Persitence().getSetting(),
      builder: (BuildContext context, AsyncSnapshot<Settings> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
       
          final themeIsDark =
              snapshot.data == null ? false : snapshot.data!.themeDark;
          return ProvidersApp(themeIsDark: themeIsDark);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class ProvidersApp extends StatelessWidget {
  const ProvidersApp({
    Key? key,
    required this.themeIsDark,
  }) : super(key: key);

  final bool themeIsDark;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(themeIsDark == true
              ? AppBasicTheme.darkTheme
              : AppBasicTheme.lightTheme),
        ),
      ],
      child: const ThemeMaterial(),
    );
  }
}

class ThemeMaterial extends StatelessWidget {
  const ThemeMaterial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo3',
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      darkTheme: AppBasicTheme.darkTheme,
      routes: AppRoute.routes(),
      initialRoute: AppRoute.initial,
    );
  }
}

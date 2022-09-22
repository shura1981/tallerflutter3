import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/settings.dart';
import '../providers/persistence.dart';
import '../providers/themeprovider.dart';
import '../themes/basic_theme.dart';

class Preferencies extends StatefulWidget {
  const Preferencies({Key? key}) : super(key: key);

  @override
  _PreferenciesState createState() => _PreferenciesState();
}

class _PreferenciesState extends State<Preferencies> {
  late ThemeProvider theme;
  bool isDark = false;
  Settings? user;
  @override
  Widget build(BuildContext context) {
    theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuraciones"),
      ),
      body: FutureBuilder(
        future: Persitence().getSetting(),
        builder: (BuildContext context, AsyncSnapshot<Settings> snapshot) {
          print(snapshot.data);

          if (snapshot.connectionState == ConnectionState.done) {
            user = snapshot.data;
            if (user != null) {
              isDark = user!.themeDark;
              return ListView(
                children: [
                  CheckboxListTile(
                    title: const Text("Theme Dark"),
                    value: isDark,
                    onChanged: (value) {
                      isDark = !isDark;
                      final selectTheme = isDark
                          ? AppBasicTheme.darkTheme
                          : AppBasicTheme.lightTheme;
                      theme.setTheme(selectTheme);
                      user!.themeDark = isDark;
                      // final user = Settings(
                      //     themeDark: isDark, photo: '', userName: 'Steven realpe');

                      Persitence()
                          .setSetting(user!.toJson())
                          .then(
                            (_) => print("guardado"),
                          )
                          .catchError((e) {
                        print(e);
                      });
                      setState(() {});
                    },
                  )
                ],
              );
            } else {
              user = Settings(
                  themeDark: isDark, photo: '', userName: 'Steven realpe');

              Persitence().setSetting(user!.toJson());
              return const Center(
                child: Text('Usuario creado'),
              );
            }
          }

          return Container();
        },
      ),
    );
  }
}

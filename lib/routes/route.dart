import 'package:flutter/material.dart';

import '../pages/pages.dart';

class AppRoute {
  static const initial = "home";
  static Map<String, WidgetBuilder> routes() {
    return {
      'home': (context) => const Home(),
      'textfields': (context) => const TextFieldsScreen(),
      'stream': (context) => const StreamScreen(),
      'barnav': (context) => const NavigationBarScreen(),
      'bottomsheet': (context) => const MyBottomSheet(),
      'expansiontitle': (context) => const MyExpansionTile(),
      'infinitys': (context) => const InfintyScroll()
    };
  }
}

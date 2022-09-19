import 'package:flutter/material.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _index = 0;
  final screens = [
    Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/andrea_back_burnerstack.png').image,
              fit: BoxFit.cover)),
      child: const Center(
          child: Text(
        'Email',
        style: TextStyle(color: Colors.white, fontSize: 18),
      )),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/blurhombre.jpg').image,
              fit: BoxFit.cover)),
      child: const Center(
          child: Text(
        'Chat',
        style: TextStyle(color: Colors.white, fontSize: 18),
      )),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/blurmujer.jpg').image,
              fit: BoxFit.cover)),
      child: const Center(
          child: Text(
        'Spaces',
        style: TextStyle(color: Colors.white, fontSize: 18),
      )),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('NavBottom'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          child: NavigationBar(
              height: 60,
              // backgroundColor: Colors.red,
              labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              selectedIndex: _index,
              onDestinationSelected: (value) {
                setState(() {
                  _index = value;
                });
              },
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.email_outlined), label: 'Mail'),
                NavigationDestination(
                    icon: Icon(Icons.email_outlined), label: 'Chat'),
                NavigationDestination(
                    icon: Icon(Icons.verified_user_outlined), label: 'Spaces')
              ]),
        ),
        body: screens[_index]);
  }
}

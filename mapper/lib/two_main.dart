import 'package:flutter/material.dart';
import 'package:mapper/map/marker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F67),
        accentColor: const Color(0xFF167F67),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      home: DisplayMap(),
    );
  }
}

class DisplayMap extends MyApp {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: PlaceMarkerPage(),
    );
  }
}
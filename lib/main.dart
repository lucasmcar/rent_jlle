import 'package:flutter/material.dart';
//import 'package:rent_jlle/pages/detalhes_page.dart';
import 'package:rent_jlle/pages/feed_page.dart';
import 'package:rent_jlle/routes/routes_generator.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FeedPage(),
    title: 'Casa Direta',
    initialRoute: '/',
    onGenerateRoute: RoutesGenerator.generateRoute,
  ));
}

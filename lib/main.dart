import 'package:flutter/material.dart';
import 'package:imovel_direto/pages/detalhes_page.dart';
//import 'package:rent_jlle/pages/detalhes_page.dart';
import 'package:imovel_direto/pages/register_house_page.dart';
import 'package:imovel_direto/routes/routes_generator.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DetalhesPage(),
    title: 'Casa Direta',
    initialRoute: '/details',
    onGenerateRoute: RoutesGenerator.generateRoute,
  ));
}

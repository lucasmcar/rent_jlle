import 'package:flutter/material.dart';
import 'package:imovel_direto/pages/lista_aluguel.dart';
import 'package:imovel_direto/pages/register_house_page.dart';
import 'package:imovel_direto/pages/register_user_page.dart';
//import 'package:imovel_direto/pages/register_house_page.dart';
import 'package:imovel_direto/routes/routes_generator.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListaAluguel(),
    title: 'Casa Direta',
    initialRoute: '/list'
        '',
    onGenerateRoute: RoutesGenerator.generateRoute,
  ));
}

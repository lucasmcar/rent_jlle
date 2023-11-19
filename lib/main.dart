import 'package:flutter/material.dart';
import 'package:imovel_direto/pages/house_pages/register_house_info_page.dart';
import 'package:imovel_direto/pages/house_pages/register_house_page.dart';
//import 'package:imovel_direto/pages/map_page.dart';
//import 'package:imovel_direto/pages/register_user_page.dart';
//import 'package:imovel_direto/pages/register_house_page.dart';
import 'package:imovel_direto/routes/routes_generator.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegisterHouseInfo(),
    title: 'Casa Direta',
    initialRoute: '/info',
    onGenerateRoute: RoutesGenerator.generateRoute,
  ));
}

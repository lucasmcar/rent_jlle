import 'package:flutter/material.dart';
import 'package:imovel_direto/models/imovel.dart';
import 'package:imovel_direto/pages/details_page.dart';
import 'package:imovel_direto/pages/lista_aluguel.dart';
import 'package:imovel_direto/pages/register_house_page.dart';
import 'package:imovel_direto/pages/register_user_page.dart';
import 'package:imovel_direto/pages/user_profile_page.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/list':
        return MaterialPageRoute(builder: (context) => const ListaAluguel());
      case '/details':
        return MaterialPageRoute(builder: (_) => DetailsPage(args as Imovel));
      case '/createRent':
        return MaterialPageRoute(
            builder: (context) => const RegistraCasaPage());
      case '/createUser':
        return MaterialPageRoute(builder: (context) => const CriaUsuarioPage());
      case '/profile':
        return MaterialPageRoute(builder: (context) => const ProfileUserPage());
    }
    throw Exception("Erro");
  }
}

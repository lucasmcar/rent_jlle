import 'package:flutter/material.dart';
import 'package:imovel_direto/models/imovel.dart';
import 'package:imovel_direto/pages/details_page.dart';
import 'package:imovel_direto/pages/feed_aluguel_page.dart';
import 'package:imovel_direto/pages/house_pages/register_house_info_page.dart';
import 'package:imovel_direto/pages/map_page.dart';
import 'package:imovel_direto/pages/house_pages/register_house_page.dart';
import 'package:imovel_direto/pages/register_user_page.dart';
import 'package:imovel_direto/pages/user_profile_page.dart';

import '../pages/login_page.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/info':
        return MaterialPageRoute(
            builder: (context) => const RegisterHouseInfo());
      case '/map':
        return MaterialPageRoute(builder: (context) => const MapPage());
      case '/login':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case '/message':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case '/list':
        return MaterialPageRoute(builder: (context) => const FeedAluguelPage());
      case '/details':
        return MaterialPageRoute(builder: (_) => DetailsPage(args as Imovel));
      /*case '/createRent':
        return MaterialPageRoute(
            builder: (context) => const RegistraCasaPage());*/
      case '/createUser':
        return MaterialPageRoute(builder: (context) => const CriaUsuarioPage());
      case '/profile':
        return MaterialPageRoute(builder: (context) => const ProfileUserPage());
    }
    throw Exception("Erro");
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:imovel_direto/controller/location_controller.dart';
import 'package:imovel_direto/utils/labels_util.dart';

class RegisterHouseAddresPage extends StatefulWidget {
  const RegisterHouseAddresPage({super.key});

  @override
  State<RegisterHouseAddresPage> createState() =>
      _RegisterHouseAddresPageState();
}

class _RegisterHouseAddresPageState extends State<RegisterHouseAddresPage> {
  LocationController localController = LocationController();

  Position? positionLocation;
  @override
  void initState() {
    _listenCurrentPosition();
    super.initState();
  }

  _listenCurrentPosition() async {
    positionLocation = await localController.getCurrentPostion();

    if (positionLocation != null) {
      setState(() {
        localController.getStreetAddress(positionLocation!);
        localController.getAddressSub(positionLocation!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

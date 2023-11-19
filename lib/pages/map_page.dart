import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imovel_direto/controller/location_controller.dart';
import 'package:imovel_direto/utils/colors/paleta_cores.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _gMapController = Completer();

  LocationController localController = LocationController();

  StreamSubscription<Position>? positionStream;
  Position? positionLocation;

  _onMapCreated(GoogleMapController controller) {
    _gMapController.complete(controller);
  }

  @override
  void initState() {
    listenPosition();
    super.initState();
  }

  listenPosition() async {
    LocationPermission? permission;
    if (permission == LocationPermission.denied) {
      _showMessage(
          'Parece que você não permitiu o uso do GPS. Abra as configurações');
    } else {
      bool gpsIsEnabled = await Geolocator.isLocationServiceEnabled();

      if (!gpsIsEnabled) {
        _showMessage(
            'Seu GPS está desativado. Para obtera localização, ative-o');
      }

      positionLocation = await localController.getCurrentPostion();

      if (positionLocation != null) {
        setState(() {
          localController.getStreetAddress(positionLocation!);
          localController.getAddressSub(positionLocation!);
        });
      }
    }
  }

  _showMessage(String message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          behavior: SnackBarBehavior.floating,
        ),
      );

  void handleClick(int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton<int>(
              color: PaletaCores.bgPurple,
              onSelected: (item) => handleClick(item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      'Login',
                      style: TextStyle(color: PaletaCores.whiteDefault),
                    )),
                PopupMenuItem<int>(
                    value: 1,
                    child: Text('Settings',
                        style: TextStyle(color: PaletaCores.whiteDefault))),
              ],
            )
          ],
          centerTitle: true,
          backgroundColor: PaletaCores.bgPurpleAcc,
          elevation: 0,
          title: const Text(
            "Imóveis próximos",
            style: TextStyle(
                color: PaletaCores.whiteDefault,
                fontWeight: FontWeight.normal,
                fontFamily: "Raleway"),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Observer(
                      builder: (_) {
                        if (localController.isLoading) {
                          return const Padding(
                            padding: EdgeInsets.all(8),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else {
                          return ListTile(
                            onTap: () async {
                              positionLocation =
                                  await localController.getCurrentPostion();
                              if (positionLocation != null) {
                                localController
                                    .getStreetAddress(positionLocation!);
                                localController
                                    .getAddressSub(positionLocation!);
                              } else {
                                const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                      child: Text("Sem dados disponpiveis",
                                          style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: PaletaCores.bgPurpleAcc))),
                                );
                              }
                              ;
                            },
                            leading: positionLocation != null
                                ? const Icon(
                                    Icons.location_on_outlined,
                                    size: 35,
                                    color: Colors.green,
                                  )
                                : const Icon(Icons.location_on_outlined,
                                    size: 35, color: Colors.red),
                            title: Text(localController.bairro),
                            subtitle: Text(localController.rua),
                          );
                        }
                      },
                    ),
                    Flexible(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(positionLocation!.latitude,
                                positionLocation!.longitude),
                            zoom: 16),
                        onMapCreated: _onMapCreated,
                      ),
                    ),
                  ],
                ))));
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mobx/mobx.dart';

part 'location_controller.g.dart';

class LocationController = LocationControllerBase with _$LocationController;

abstract class LocationControllerBase with Store {
  @observable
  String rua = '';

  @observable
  String bairro = '';

  @observable
  Position? posicaoAtual;

  @observable
  int nrcasa = 0;

  Position? pst;

  @observable
  bool isLoading = false;

  @action
  Future<void> getStreetAddress(Position p) async {
    isLoading = true;
    await placemarkFromCoordinates(p.latitude, p.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      isLoading = false;
      bairro = "${place.subLocality!} - ${place.subAdministrativeArea}";
      return bairro;
    }).onError((error, stackTrace) {
      throw Exception(error.toString());
    });
  }

  @action
  Future<void> getAddressSub(Position p) async {
    isLoading = true;
    await placemarkFromCoordinates(p.latitude, p.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      isLoading = false;
      rua = "${place.thoroughfare!}, ${place.subThoroughfare}";
      return rua;
    }).onError((error, stackTrace) {
      throw Exception(error.toString());
    });
  }

  @action
  Future<Position> getCurrentPostion() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }
}



 /* @action
  Future<void> getNearbyPlaces() async {
    if(posicaoAtual != null){

    }
  }*/


  /*Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _posicaoAtual = position);
      _getStreetAddress(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @action
  Future<void> getLocationAddress() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
    .then((Position p) {
      pst = p; 
    }
    );
    final coordinates = Geolocator. (position.latitude, position.longitude);


    
    return '';
  }*/

import 'package:http/http.dart' as http;

/*class PlacesService {
  static const String _apiKey = 'YOUR_GOOGLE_PLACES_API_KEY';

  Future<List<dynamic>> getNearbyPlaces(double latitude, double longitude, String type) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1500&type=$type&key=$_apiKey';
https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=aluguel&location=-26.270897397782296,-48.84659299931675&radius=1500&type=sublocality&key=AIzaSyAMoasY7IwUStXu5PgTWc4F8L1f-QOAim4%20%20
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load nearby places');
    }
  }
}*/
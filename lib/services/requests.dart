import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Requests {
  String _key;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  Requests() {
    _setKey();
  }

  _setKey() async {
    RemoteConfig _remoteConfig = await RemoteConfig.instance;
    await _remoteConfig.fetch(expiration: const Duration(hours: 1));
    await _remoteConfig.activateFetched();

    _key = _remoteConfig.getValue('YELP_API_KEY').asString();
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _currentPosition = position;
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      _currentAddress =
          "${place.locality}, ${place.postalCode}, ${place.country}";
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String,dynamic>> getRestaurantsNearby() async {
    var response = await http.get("https://api.yelp.com/v3/businesses/search?latitude=" + _currentPosition.latitude.toString() + "&longitude=" + _currentPosition.longitude.toString() + "&radius=5000&limit=5",headers: {"Authorization": "Bearer " + _key});
    return json.decode(response.body);
  }
}

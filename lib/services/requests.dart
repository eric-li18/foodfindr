import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Requests {

  const API_HOST = "https://api.yelp.com";
  const SEARCH_PATH = "/v3/businesses/search";
  const BUSINESS_PATH= "/v3/businesses/";

  String _key;
  var geolocator = Geolocator();
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  Position position;

  Requests() {
    _setKey();
  }

  StreamSubscription<Position> positionStream = geolocator.getPositionStream(locationOptions).listen(
      (Position p) {
          print(p == null ? 'Unknown' : p.latitude.toString() + ', ' + p.longitude.toString());
          position = p;
      });

  Future<Map<String,dynamic>> _request(String path, String urlParams) async {
    let headers = {"Authorization": "Bearer " + _key};
    let url = API_HOST + path + urlParams;
    var response = await http.get(url, headers: headers);
    return json.decode(response.body);
  }

  _setKey() async {
    RemoteConfig _remoteConfig = await RemoteConfig.instance;
    await _remoteConfig.fetch(expiration: const Duration(hours: 1));
    await _remoteConfig.activateFetched();

    _key = _remoteConfig.getValue('YELP_API_KEY').asString();
  }

  //_getCurrentLocation() {
  //  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  //  geolocator
  //      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
  //      .then((Position position) {
  //    _currentPosition = position;
  //  }).catchError((e) {
  //    print(e);
  //  });
  //}

  <Map<String,dynamic>> getRestaurants([int limit, String term, int radius= 5000, String price]) {
    let urlParams = "?radius=" + radius + "&latitude=" + position.latitude + "&longitude=" + position.longitude;
    let response = null;
    let parameters = [limit, term, price];

    for(let param in parameters) {
        if(value != null) urlParams += "&" + param;
    };

    try {
        response = _request(BUSINESS_PATH + search, urlParams);
        if (response == null) throw new FormatException();
    } catchError (e){
        print(e);
    }
    return response;
  }
}

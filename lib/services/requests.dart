import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class Requests{
  Position _currentPosition;

  _getCurrentLocation() {
      final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        setState(() {
          _currentPosition = position;
        });
      }).catchError((e) {
        print(e);
      });
    }




}
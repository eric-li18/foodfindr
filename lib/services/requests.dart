import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Requests{
  final RemoteConfig _remoteConfig = await RemoteConfig.instance;
  await _remoteConfig.fetch(expiration: const Duration(hours: 1));
  await _remoteConfig.activateFetched();

  _remoteConfig.getValue('YELP_API_KEY').asString();
  // Position _currentPosition;

  // _getCurrentLocation() {
  //     final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  //     geolocator
  //         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
  //         .then((Position position) {
  //       setState(() {
  //         _currentPosition = position;
  //       });
  //     }).catchError((e) {
  //       print(e);
  //     });
  //   }

  // _getAddressFromLatLng() async {
  //     try {
  //       List<Placemark> p = await geolocator.placemarkFromCoordinates(
  //           _currentPosition.latitude, _currentPosition.longitude);

  //       Placemark place = p[0];

  //       setState(() {
  //         _currentAddress =
  //             "${place.locality}, ${place.postalCode}, ${place.country}";
  //       });
  //     } catch (e) {
  //       print(e);
  //     }
  //   }


}
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationHandler {
  static Future<bool> handleLocationPermission() async {
    // bool serviceEnabled;
    LocationPermission permission;

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return false;
    // }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  static Future<Position?> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) {
      return null;
    }
    print('called 2');
    try {
      final hasPermission = await handleLocationPermission();
      if (!hasPermission) return null;
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, String>?> getAddressFromLatLng() async {
    print('called 1');
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) {
      return null;
    }
    try {
      Position? position = await getCurrentPosition();
      if (position == null) return null;

      List<Placemark> placeMarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placeMarks[0];
      print(place.street);
      print(place.postalCode);

      return {
        'locality': place.locality ?? '',
        'fullAddress':
            "${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}"
      };
    } catch (e) {
      return null;
    }
  }
}

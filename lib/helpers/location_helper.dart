import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:kishk_driver/shared/widgets/action_dialog.dart';

class LocationHelper {
  static Future<Position> determinePosition() async {
    final GeolocatorPlatform mGeoLocatorPlatform = GeolocatorPlatform.instance;

    if (await Permission.location.isRestricted ||
        await Permission.location.isDenied ||
        await Permission.location.isPermanentlyDenied) {
      // onLocationError();
    }

    LocationPermission permission;

    permission = await mGeoLocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await mGeoLocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await mGeoLocatorPlatform.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.low),
    );
  }

  static Future<Address> getLocationAddress(
      double latitude, double longitude) async {
    return await GeoCode().reverseGeocoding(latitude: latitude, longitude: longitude);
  }

  static void onLocationError() {
    EasyLoading.dismiss();
    showDialog(
      context: Get.context!,
      builder: (context) => ActionDialog(
        message: 'invalid_location_error'.tr,
      ),
    );
  }
}

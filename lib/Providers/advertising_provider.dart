import 'package:flutter/material.dart';
import 'package:pro_angler/Models/advertising.dart';
import 'package:pro_angler/Services/advertising_service.dart';

class AdvertisingProvider with ChangeNotifier {
  final AdvertisingService _advertisingService = AdvertisingService();
  List<Advertising> _advertisements = [];

  List<Advertising> get advertisements => _advertisements;

  Future<void> addAdvertisement(Advertising ad) async {
    await _advertisingService.addAdvertisement(ad);
    notifyListeners();
  }

  Future<void> loadAdvertisements() async {
    _advertisements = await _advertisingService.getAdvertisements();
    notifyListeners();
  }

  Future<void> updateAdvertisement(String id, Advertising ad) async {
    await _advertisingService.updateAdvertisement(id, ad);
    notifyListeners();
  }

  Future<void> deleteAdvertisement(String id) async {
    await _advertisingService.deleteAdvertisement(id);
    notifyListeners();
  }
}
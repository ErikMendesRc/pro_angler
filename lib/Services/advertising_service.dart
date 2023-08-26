import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_angler/Models/advertising.dart';

class AdvertisingService {
  final CollectionReference _advertisingCollection =
      FirebaseFirestore.instance.collection('advertising');

  Future<void> addAdvertisement(Advertising ad) async {
    await _advertisingCollection.add(ad.toJson());
  }

  Future<List<Advertising>> getAdvertisements() async {
    final QuerySnapshot snapshot = await _advertisingCollection.get();

    final List<Advertising> ads = [];
    for (var doc in snapshot.docs) {
      final ad = Advertising.fromJson(doc.data() as Map<String, dynamic>);
      ads.add(ad);
    }

    return ads;
  }

  Future<void> updateAdvertisement(String id, Advertising ad) async {
    await _advertisingCollection.doc(id).update(ad.toJson());
  }

  Future<void> deleteAdvertisement(String id) async {
    await _advertisingCollection.doc(id).delete();
  }
}
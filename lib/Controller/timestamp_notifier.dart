import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TimestampNotifier with ChangeNotifier {
  ValueNotifier<Timestamp?> startTimestamp = ValueNotifier<Timestamp?>(null);
  ValueNotifier<Timestamp?> endTimestamp = ValueNotifier<Timestamp?>(null);

  void updateStartTimestamp(Timestamp value) {
    startTimestamp.value = value;
    notifyListeners();
  }

  void updateEndTimestamp(Timestamp value) {
    endTimestamp.value = value;
    notifyListeners();
  }
}
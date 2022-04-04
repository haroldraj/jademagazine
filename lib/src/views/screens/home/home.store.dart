import 'package:flutter/material.dart';
import 'package:jademagazine/src/models/activity.model.dart';
import 'package:jademagazine/src/services/crud.service.dart';

class HomeStore extends ChangeNotifier {
  CRUDService _crudService = CRUDService(collection: "activities");
  List<ActivityModel> _activities = [];
  List<ActivityModel> get activities => _activities;

  void init() {
    // DONNEES NON TEMPS REEL - BOUCLENA FOTSN LE ACTIVITIES
    _crudService.getDocs().then((value) {
      value.documents.map((activity) {
        _activities.add(ActivityModel.fromJSON(activity.data));
      }).toList();
      notifyListeners();
    }).catchError((onError) => print(onError));
  }

  void add(Map<String, dynamic> data) {
    _crudService
        .insertDoc(data)
        .then((value) => print(value))
        .catchError((onError) => print(onError))
        .whenComplete(() => null);
  }

  void update(String id, Map<String, dynamic> data) {
    _crudService
        .updateDoc(id, data)
        .then((value) => print("Done"))
        .catchError((onError) => print(onError))
        .whenComplete(() => null);
  }

  void delete(String id) {
    _crudService
        .deleteDoc(id)
        .then((value) => print("Done"))
        .catchError((onError) => print(onError))
        .whenComplete(() => null);
  }
}

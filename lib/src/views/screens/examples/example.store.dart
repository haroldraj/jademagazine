import 'package:flutter/material.dart';
import 'package:jademagazine/src/services/crud.service.dart';
import 'package:toast/toast.dart';

class ExampleStore extends ChangeNotifier {
  CRUDService _crudService = CRUDService(collection: "activities");
  Map<String, dynamic> _inputs = {};
  Map<String, dynamic> get inputs => _inputs;

  void handleInputs(String key, String value) {
    _inputs[key] = value;
    notifyListeners();
  }

  void add(BuildContext context) {
    _crudService
        .insertDoc(_inputs)
        .then((value) => Toast.show("Valeur ajouté", context))
        .catchError((onError) => Toast.show(onError, context))
        .whenComplete(() => null);
  }
}

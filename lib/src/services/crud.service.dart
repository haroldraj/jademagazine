import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDService {
  String collection;
  CRUDService({this.collection});

  Future<QuerySnapshot> getDocs() {
    return Firestore.instance.collection(collection).getDocuments();
  }

  Future<void> updateDoc(String id, Map<String, dynamic> data) {
    return Firestore.instance.collection(collection).document(id).setData(data);
  }

  Future<DocumentReference> insertDoc(Map<String, dynamic> data) {
    return Firestore.instance.collection(collection).add(data);
  }

  Future<void> deleteDoc(String id) {
    return Firestore.instance.collection(collection).document(id).delete();
  }
}

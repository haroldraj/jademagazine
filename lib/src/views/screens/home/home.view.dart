import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jademagazine/src/views/screens/home/home.store.dart';
import 'package:jademagazine/src/views/widgets/loader.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeStore>.reactive(
        onModelReady: (store) => store.init(),
        builder: (context, store, _) => Scaffold(
              body: Container(
                child: StreamBuilder<QuerySnapshot>(
                    stream:
                        Firestore.instance.collection("activities").snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError)
                        return new Text('Error :${snapshot.error}');
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Loader();
                        default:
                          return ListView(
                            children: snapshot.data.documents
                                .map((activity) =>
                                    ListTile(title: Text(activity["title"])))
                                .toList(),
                          );
                      }
                    }),
              ),
            ),
        viewModelBuilder: () => HomeStore());
  }
}

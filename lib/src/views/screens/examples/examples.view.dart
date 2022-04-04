import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jademagazine/src/views/screens/examples/example.store.dart';
import 'package:jademagazine/src/views/widgets/loader.dart';
import 'package:stacked/stacked.dart';

class ExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExampleStore>.reactive(
        builder: (context, store, _) => Scaffold(
            appBar: AppBar(),
            body: Container(
              child: Column(
                children: [
                  TextField(
                    onChanged: (text) => store.handleInputs("title", text),
                  ),
                  TextField(
                    onChanged: (text) => store.handleInputs("lieu", text),
                  ),
                  RaisedButton(
                    onPressed: () => store.add(context),
                    child: Text("Add new activity"),
                  ),
                  Expanded(child: ActivityList())
                ],
              ),
            )),
        viewModelBuilder: () => ExampleStore());
  }
}

class ActivityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("activities").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            }));
  }
}

import 'dart:async';

import 'package:bitnavigatormap/screens/detail_information.dart';
import 'package:bitnavigatormap/screens/polyLine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DataSearch extends SearchDelegate<String> {
  CollectionReference ref = FirebaseFirestore.instance.collection("Buildings");
  CollectionReference ref2 = FirebaseFirestore.instance.collection("Offices");
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear,color: Colors.amber),
        onPressed: () {
          query = "";
        },
      )
    ];
    // throw UnimplementedError();
  }

 List<LatLng> _polylineCoordinates = [    LatLng(37.77483, -122.41942),    LatLng(37.78519, -122.40654),    LatLng(37.77745, -122.39074),  ];


   Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: const Icon(Icons.arrow_back,color: Colors.amber,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ref.snapshots().asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return StreamBuilder(
            stream: ref2.snapshots().asBroadcastStream(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot2) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot2.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if ((snapshot.data!.docs
                      .where((QueryDocumentSnapshot<Object?> element) =>
                          element['name']
                              .toString()
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                      .isEmpty) &&
                  (snapshot2.data!.docs
                      .where((QueryDocumentSnapshot<Object?> element) =>
                          element['name']
                              .toString()
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                      .isEmpty)) {
                return const Center(
                  child: Text("unkown place"),
                );
                // }
              }
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    ...snapshot.data!.docs
                        .where((QueryDocumentSnapshot<Object?> element) =>
                            element['name']
                                .toString()
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                        .map(
                      (QueryDocumentSnapshot<Object?> data) {
                        final String title = data.get('name');
                        // final String image = data.get('image');
                        // final String price = data.get('price');
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        detailInfo(id: data.get('id'),title: data.get('id'),)));
                          },
                          title: Text(title),
                          leading: GestureDetector(
                                       onTap: ()
                                       {
                                      Navigator.push(
                                      context,
                                       MaterialPageRoute(
                                      builder: (context) =>
                                          polyLineplaces(id: data.get('id'), title: data.get('name'),),
                                    )
                                    );

                                       },
                                      child:const Icon(
                                       Icons.navigation,
                                       color: Colors.orange,

                                   ),
                                       ),
                          // subtitle: Text(price),
                        );
                      },
                    ),
                  ],
                );
              } else if (snapshot2.hasData) {
                return ListView(
                  children: [
                    ...snapshot2.data!.docs
                        .where((QueryDocumentSnapshot<Object?> element) =>
                            element['name']
                                .toString()
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                        .map(


               (QueryDocumentSnapshot<Object?> data) {
                        final String title = data.get('name');
                        // final String image = data.get('image');
                        // final String price = data.get('price');
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        detailInfo(id: data.get('id'),title: data.get('name'),)));
                          },
                          title: Text(title),
                          // leading: Image.network(image),
                          // subtitle: Text(price),
                        );
                      },
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text("Unknown place!"),
                );
              }
            });
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search places'),
    );
    // GoogleMap(
    //      onMapCreated: (GoogleMapController controller) {
    //       _controller = controller as Completer<GoogleMapController>;
    //     },
    //     polylines: {
    //       Polyline(
    //         polylineId: PolylineId('route1'),
    //         color: Colors.red,
    //         width: 5,
    //         points: _polylineCoordinates,
    //       ),
    //     },
    //     initialCameraPosition: CameraPosition(
    //       target: LatLng(37.77483, -122.41942),
    //       zoom: 12,
    //     ),
    //   );



  }
}
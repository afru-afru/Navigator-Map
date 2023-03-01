import 'dart:async';


import 'package:bitnavigatormap/helpers/location_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:bitnavigatormap/screens/listOfBuildings.dart';
// import 'package:bitnavigatormap/screens/listOfFaculity.dart';
// import 'package:bitnavigatormap/screens/listOfOffices.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';






// ignore: camel_case_types
// class polyLineplaces extends StatelessWidget {
//   const polyLineplaces({super.key});
//    final namex attributes;
//   const polyLineplaces(this.attributes, {super.key});
//  String id;


//   polyLineplaces({super.key, required this.id});

//   @override
//   Widget build(BuildContext context) {
//     return MyHomePage(title: 'ghfg');
//   }
// }

class descriptionAbout extends StatefulWidget {
   String id;


  descriptionAbout({super.key, required this.id, required this.title});

  // polyLineplaces({super.key, required this.title});


  final String title;

  @override
  State<descriptionAbout> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<descriptionAbout> {

  GoogleMapController? mapController;

   Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
PolylinePoints polylinePoints = PolylinePoints();








  // final LatLng _center = const LatLng(45.521563, -122.677433);

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController=controller;

  // }
final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static  final CameraPosition _kGooglePlex = CameraPosition(

    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );







     String? _currentAddress;
      static Position?position;


    Future<void> getMyCurrentLocation() async{
      await LocationHelper.getCurrentLocation();
      position = await Geolocator.getLastKnownPosition().whenComplete(() {
        setState(() {
 position = position;

        });
      });
    }

     Future<void> gotoMyCurrentLocation() async{
     final GoogleMapController controller=await _controller.future;
     controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));

  }

@override
void initState(){
  super.initState();
  getMyCurrentLocation();


}





  @override
  Widget build(BuildContext context) {

    List<LatLng> _polylineCoordinates = [    LatLng(position!.latitude, position!.longitude),    LatLng(37.78519, -122.40654),   ];


    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
        backgroundColor: Colors.brown.shade100,
        title: Text("About",style: TextStyle(color: Colors.brown),),
         shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
             ),
      ),


      body:


         StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream:
                FirebaseFirestore.instance.collection("Offices").doc(widget.id).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var doc = snapshot.data!;

                Text(doc['name']);

                return

                position !=null ?
        Stack
        (
          children: [

            const Padding(


              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text('Main Description',style: TextStyle(color: Colors.brown,fontSize: 20),)),

              Padding(padding: EdgeInsets.fromLTRB(50, 60, 10, 10),
              child: Text(doc['description']),
              )




          ]
        )
      :const Center(
        child: CircularProgressIndicator(color: Colors.orange,),


              );
              }
            }








)
    );


  }
}




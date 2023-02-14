import 'dart:async';

import 'package:bitnavigatormap/helpers/location_helpers.dart';
import 'package:bitnavigatormap/screens/listOfBuildings.dart';
import 'package:bitnavigatormap/screens/listOfFaculity.dart';
import 'package:bitnavigatormap/screens/listOfOffices.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';





void main() {
  runApp(const directions());
}

// ignore: camel_case_types
class directions extends StatelessWidget {
  const directions({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController=controller;

  }
final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static  CameraPosition _kGooglePlex = CameraPosition(

    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );


  static final Marker _kGooglePlexMarker=Marker(markerId:
  MarkerId('_kgooglePlex'),
  infoWindow: InfoWindow(title:'googlePlex'),
  icon: BitmapDescriptor.defaultMarker,
  position: LatLng(37.42796133580664, -122.085749655962),


  );


  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


   static final Polyline _kpolyline = Polyline(
    polylineId: PolylineId('_kpolylineId'),
   points: [
    LatLng(37.42796133580664, -122.085749655962),
     LatLng(37.43296265331129, -122.08832357078792),

   ],
  width: 5,



   );

   static final Polygon _kpolygon= Polygon(
    polygonId: PolygonId('_kpolygon'),
    points: [
    LatLng(37.42796133580664, -122.085749655962),
     LatLng(37.43296265331129, -122.08832357078792),
     LatLng(37.418, -112.092),
     LatLng(37.435, -112.092),

   ],
   strokeWidth: 5,

    );

      static Position?position;


    Future<void> getMyCurrentLocation() async{
      await LocationHelper.getCurrentLocation();
      position = await Geolocator.getLastKnownPosition().whenComplete(() {
        setState(() {


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

    return
    Scaffold(
      body: Stack(




        children: [
          position !=null ?
          GoogleMap(
          mapType: MapType.satellite                           ,
          markers: {_kGooglePlexMarker},
          polylines: {_kpolyline},
          polygons: {_kpolygon},
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },

        )
        :Center(
          child: Container(
            child: CircularProgressIndicator(color: Colors.orange,),
          ),

         ),

         Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
           child:
           Container(
            child:
             Column(
               children:const [  TextField(
                style: TextStyle(
                        color:Colors.black,
                      ),

                      decoration: InputDecoration(
                         filled: true, //<-- SEE HERE
                        fillColor: Colors.grey,
                        // prefixIcon: Icon(Icons.arrow_back,color: Colors.orange,),
                        // suffixIcon: Icon(Icons.close,color: Colors.orange,) ,
                        hintText: "origin location",


                        hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),



                      ),


                         ),

                          TextField(
                style: TextStyle(
                        color:Colors.black,
                      ),

                      decoration: InputDecoration(
                         filled: true, //<-- SEE HERE
                        fillColor: Colors.grey,

                        // suffixIcon: Icon(Icons.close,color: Colors.orange,) ,
                        hintText: "Destination location",


                        hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),



                      ),


                         ),
               ]
             ),
           ),
         )







        ]
      ),
    );

      // FloatingActionButton: Container(
      //   margin: EdgeInsets.fromLTRB(0, 0, 8,30),
      //   child: const FloatingActionButton(
      //     backgroundColor: Colors.orange,

      //     onPressed: () { gotoMyCurrentLocation(); },
      //     child: Icon(Icons.place,color: Colors.orange,),
      //   ),);
  }
}




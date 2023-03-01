import 'dart:async';


import 'package:bitnavigatormap/helpers/location_helpers.dart';
import 'package:bitnavigatormap/screens/descriptionAbout.dart';
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

class polyLineOffice extends StatefulWidget {
   String id;




  polyLineOffice({super.key, required this.id, required this.title});

  // polyLineplaces({super.key, required this.title});


  final String title;

  @override
  State<polyLineOffice> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<polyLineOffice> {

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

    Icon actionIcon = const Icon(Icons.info,color: Colors.orange);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
        backgroundColor: Colors.white,
        title: Text(widget.title,style: TextStyle(color: Colors.brown),),
         shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
             ),
             actions: [
             GestureDetector(
                                       onTap: ()
                                       {
                                      Navigator.push(
                                      context,
                                       MaterialPageRoute(
                                      builder: (context) =>
                                          descriptionAbout(id:widget.id,title: widget.title,),
                                    )
                                    );

                                       },
                                      child:const Icon(
                                       Icons.info,
                                       color: Colors.orange,
                                       size: 30,

                                   ),
                                       ),]
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
          children: [GoogleMap(
          mapType: MapType.satellite                        ,

          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
           polylines: {
            Polyline(
              polylineId: const PolylineId('route1'),
              color: Colors.red,
              width: 7,
              points: [    LatLng(position!.latitude, position!.longitude),    LatLng( double.parse("${doc['lat']}") ,double.parse("${doc['long']}") ),   ]
            ),},
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },

              ),




          ]
        )
      :const Center(
        child: CircularProgressIndicator(color: Colors.orange,),


              );
              }
            }








)
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



// class homepage extends StatelessWidget {
//   homepage({super.key});
//      GoogleMapController? mapController;

//   final LatLng _center = const LatLng(45.521563, -122.677433);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController=controller;

//   }
// final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);




//   @override
//   Widget build(BuildContext context) {
//     return Stack(


//       children: [
//         GoogleMap(
//         mapType: MapType.hybrid,
//         myLocationButtonEnabled: false,
//         zoomControlsEnabled: false,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },

//       ),
//       Container(
//         child: (
//          Row(
//           //  scrollDirection: Axis.horizontal,
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(15, 8, 8, 650),
//               child: InkWell(
//                 onTap: ()
//                   {
//                     Navigator.push( context,MaterialPageRoute(
//               builder: (context) => homepage2(),
//             )
//             );
//                   }
//                 ,
//                 child: Container(
//                   width: 110,
//                   height: 30,

//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade100),
//                   child:const Center(child:Text('Buildings',style: TextStyle(fontSize: 15,color:Colors.black26,decoration: TextDecoration.none ),))
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(15, 8, 8, 650),
//               child: InkWell(
//                 onTap: ()
//                      {
//                       Navigator.push( context,MaterialPageRoute(
//               builder: (context) => const listOfOffices(),
//             )
//             );
//                      }
//                 ,
//                 child: Container(

//                   width: 110,
//                   height: 30,

//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade100),
//                   child:const Center(child:Text('Offices',style: TextStyle(fontSize: 16,color:Colors.black26,decoration: TextDecoration.none),))
//                 ),
//               ),
//             ),
//              Padding(
//               padding: const EdgeInsets.fromLTRB(15, 8, 8, 650),
//               child: InkWell(
//                 onTap: ()
//                     {
//                       Navigator.push( context,MaterialPageRoute(
//               builder: (context) => const listOfFaculity(),
//             )
//             );
//                     }





//                 ,
//                 child: Container(
//                   width: 110,
//                   height: 30,

//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade100),
//                   child:const Center(child:Text('Faculity',style: TextStyle(fontSize: 16,color:Colors.black26,decoration: TextDecoration.none ),))
//                 ),
//               ),
//             ),

//           ],

//          )
//         ),
//       )
//       ]
//     );
//   }
// }







import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'buildingInformation.dart';
import 'descriptionAboutBuildings.dart';

// class detailInfo extends StatelessWidget {
//   // final Contents contents;
//   String id;


//   detailInfo({super.key, required this.id});
//   Widget appBarTitle=const Text("",style: TextStyle(color: Colors.black45,fontSize: 17),);

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: const IconThemeData(
//             color: Colors.orange,
//           ),
//           title: appBarTitle,

//           centerTitle: true,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(10),
//                   bottomLeft: Radius.circular(10))),
//           backgroundColor: Colors.grey.shade100,
//           actions: const [Icon(Icons.arrow_drop_down_outlined)],
//         ),
//         body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//             stream:
//                 FirebaseFirestore.instance.collection("Buildings").doc(id).snapshots(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 var doc = snapshot.data!;
//                 appBarTitle=
//                 Text(doc['name']);

//                 return

//                  Panorama
//              (
//                zoom: 1,
//                   animSpeed: 1.0,

//               child:
//             Image(image: NetworkImage(doc["image"]),),
//               );
//               }
//             }


//              ),


//             );

//   }
// }



class detailInfo extends StatefulWidget {
  detailInfo({super.key, required this.id,required this.title});

  String title;
  String id;

  @override
  State<detailInfo> createState() => _detailInfoState();
}

class _detailInfoState extends State<detailInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.orange,
          ),
          title: Text(widget.title,style: TextStyle(color: Colors.brown),),

          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          backgroundColor: Colors.grey.shade100,

          actions: [
             GestureDetector(
                                       onTap: ()
                                       {
                                      Navigator.push(
                                      context,
                                       MaterialPageRoute(
                                      builder: (context) =>
                                          descriptionAboutBuildings(id:widget.id,title: widget.title,),
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
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream:
                FirebaseFirestore.instance.collection("Buildings").doc(widget.id).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var doc = snapshot.data!;


                return

                 Panorama
             (
               zoom: 1,
                  animSpeed: 1.0,

              child:
            Image(image: NetworkImage(doc["image"]),),
              );
              }
            }


             ),


            );

  }
}


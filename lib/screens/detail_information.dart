import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'buildingInformation.dart';


class detailInfo extends StatelessWidget {
  final Contents contents;
  const detailInfo(this.contents, {super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:

          AppBar(
             iconTheme: const IconThemeData(
       color: Colors.orange,
        ),

        title:Text( contents.name,style: TextStyle(color: Colors.black26),),
        centerTitle: true,


           shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10)
        )
        ),
        backgroundColor: Colors.grey.shade100,
        actions: [Icon(Icons.arrow_drop_down_outlined)],

         ),

         body:
        //Padding(padding: const EdgeInsets.all(8.0),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [

          //    Padding(padding: EdgeInsets.fromLTRB(8, 2, 8, 8),
          //  child:
           Panorama
           (
             zoom: 1,
                animSpeed: 1.0,

            child:
             Image.asset(contents.imgName)
            ),
          //  ),


          //  Padding(padding: EdgeInsets.all(8.0),
          //  child: Text(
          //   contents.name,
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(fontSize: 25.0,fontStyle: FontStyle.italic,color: Colors.orange),
          //  ),
          //  ),
          //  Padding(padding: EdgeInsets.all(8.0),
          //  child: Text(
          //   contents.description,
          //    textAlign: TextAlign.justify,
          //   style: const TextStyle(fontSize: 22.0,fontStyle: FontStyle.italic),
          //  ),
          //  )


          // ],
        );
        // ),
    // );
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';

import 'officeInformation.dart';
import 'listOfOffices.dart';


class officeCardinformation extends StatelessWidget {
  final Attributes attributes;
  const officeCardinformation(this.attributes, {super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( attributes.name),
           shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        )
        ),


        ),
        body: Padding(padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Padding(padding: EdgeInsets.all(8.0),
           child: Text(
            attributes.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17.0,fontStyle: FontStyle.italic),
           ),
           ),
           Padding(padding: EdgeInsets.all(8.0),
           child: Text(
            attributes.description,
             textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 22.0,fontStyle: FontStyle.italic),
           ),
           )


          ],
        ),
        ),
    );
  }
}
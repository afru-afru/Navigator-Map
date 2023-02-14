import 'package:flutter/material.dart';


class allLists extends StatelessWidget {
  const allLists({super.key});

  @override
  Widget build(BuildContext context) {
    return places();
  }
}

class places extends StatefulWidget {
  const places({super.key});

  @override
  State<places> createState() => _placesState();
}

class _placesState extends State<places> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
         iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
        title: const Text('All Locations',style: TextStyle(color: Colors.black26),),
        backgroundColor: Colors.grey.shade100,
     shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
             ),
      ),
    );
  }
}
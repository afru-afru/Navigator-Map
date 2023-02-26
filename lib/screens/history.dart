import 'package:flutter/material.dart';


class history extends StatelessWidget {
  const history({super.key});

  @override
  Widget build(BuildContext context) {
    return histories();
  }
}

class histories extends StatefulWidget {
  const histories({super.key});

  @override
  State<histories> createState() => _historiesState();
}

class _historiesState extends State<histories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
    title: const Text('History',style: TextStyle(color: Colors.black26),),
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
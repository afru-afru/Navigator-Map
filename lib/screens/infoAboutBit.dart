import 'package:flutter/material.dart';



class infoAboutBit extends StatelessWidget {
  const infoAboutBit({super.key});

  @override
  Widget build(BuildContext context) {
    return aboutBit();
  }
}

class aboutBit extends StatefulWidget {
  const aboutBit({super.key});

  @override
  State<aboutBit> createState() => _aboutBitState();
}

class _aboutBitState extends State<aboutBit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
    title: const Text('About BIT',style: TextStyle(color: Colors.black26),),
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
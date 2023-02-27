import 'package:flutter/material.dart';


class shortlist extends StatelessWidget {
  const shortlist({super.key});

  @override
  Widget build(BuildContext context) {
    return favourites();
  }
}


class favourites extends StatefulWidget {
  const favourites({super.key});

  @override
  State<favourites> createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

 appBar: AppBar(
   iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
    title: const Text('Short Lists',style: TextStyle(color: Colors.brown),),
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
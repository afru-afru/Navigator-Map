import 'package:bitnavigatormap/screens/detail_information.dart';
import 'package:bitnavigatormap/screens/polyLine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
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
        title: const Text('All Locations',style: TextStyle(color: Colors.brown),),
        backgroundColor: Colors.grey.shade100,
     shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
             ),
      ),

      body:  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("Buildings")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List namex = snapshot.data!.docs;

                    return ListView.builder(
                        itemCount:snapshot.data!.docs .length,
                        itemBuilder: (BuildContext context, int index) {
                          // Attributes attributes = namex[index];

                          return Card(
                            child: ListTile(
                              title: Text(namex[index]["name"]),
                              trailing: FavoriteButton(
                                isFavorite: false,
                                iconSize: 30,
                                iconColor: Colors.orange,
                                valueChanged: (isFavorite) {
                                  // print('Is Favorite $isFavorite)');
                                },
                              ),
                              leading:  GestureDetector(
                                       onTap: ()




                                       {

                                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          polyLineplaces(id:namex[index]["id"], title: 'namex[index]["id"]',),
                                    ));

                                       },
                                      child:const Icon(
                                       Icons.navigation,
                                       color: Colors.orange,

                                   ),
                                       ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          detailInfo(id:namex[index]["id"],),
                                    ));
                              },
                            ),
                          );
                        });
                  }
                }),
    );
  }
}

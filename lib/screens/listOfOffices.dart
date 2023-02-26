import 'package:bitnavigatormap/screens/officeInformation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'buildingInformation.dart';
import 'officeCardinformation.dart';

int itemCount = 20;
const List<String> buildings = [
  'Adminstrar',
  'Clinic',
  'Registrar',
  'Scienific',
  'Library',
  'students classes'
];

class listOfOffices extends StatelessWidget {
  const listOfOffices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.orange,
          ),
          backgroundColor: Colors.grey.shade100,
          title: const Text(
            'List OF Offices',
            style: TextStyle(color: Colors.black26),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
        ),
        body:

            // ListTile(
            //  title: Text(attributes.name),
            //   trailing:FavoriteButton(
            //   isFavorite: false,
            //   iconSize: 30,
            //   iconColor:Colors.orange,

            //     valueChanged: (isFavorite) {
            //       print('Is Favorite $isFavorite)');
            //     },),
            //  leading:const Icon(Icons.navigation,color: Colors.orange,),
            //  onTap: (){
            //   Navigator.push(
            //     context,MaterialPageRoute(
            //       builder: (context) => officeCardinformation(attributes),
            //     )
            //   );
            //  },

            // ),

            // return const ListTile(
            //   title: Text('item'),
            //   leading: Icon(Icons.person),
            //   trailing: Icon(Icons.favorite)
            // ,
            // );

            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("offices")
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
                                  print('Is Favorite $isFavorite)');
                                },
                              ),
                              leading: const Icon(
                                Icons.navigation,
                                color: Colors.orange,
                              ),
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           officeCardinformation(attributes),
                                //     ));
                              },
                            ),
                          );
                        });
                  }
                }));
  }
}

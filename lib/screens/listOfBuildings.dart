import 'package:bitnavigatormap/screens/buildingInformation.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:bitnavigatormap/homepage.dart';


import 'detail_information.dart';


int itemCount=20;
const List<String> buildings=['Adminstrar','Clinic','Registrar','Scienific','Library','students classes'];

class homepage2 extends StatelessWidget {
  const homepage2({super.key});

  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
        backgroundColor: Colors.grey.shade100,
        title: const Text('List OF buildings',style: TextStyle(color: Colors.black26),),
        shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
             ),

      ),


       body:
        Center(
        child:  ListView.builder(
        itemCount: contentList.length,
        itemBuilder: (BuildContext context , int index){

          Contents contents=contentList[index];


          return Card(
          child: ListTile(
           title: Text(contents.name),
           trailing:FavoriteButton(
            isFavorite: false,
            iconSize: 30,
            iconColor:Colors.orange,

              valueChanged: (isFavorite) {
                print('Is Favorite $isFavorite)');
              },
            ),
           leading:const Icon(Icons.location_on,color: Colors.orange,),
           onTap: (){
            Navigator.push(
              context,MaterialPageRoute(
                builder: (context) => detailInfo(contents),
              )
            );
           },

          ),
          );
        // return const ListTile(
        //   title: Text('item'),
        //   leading: Icon(Icons.person),
        //   trailing: Icon(Icons.favorite)
        // ,
        // );

         }
         )
         ),
     );
  }
}
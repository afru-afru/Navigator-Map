import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'buildingInformation.dart';


int itemCount=20;
const List<String> buildings=['Adminstrar','Clinic','Registrar','Scienific','Library','students classes'];

class listOfFaculity extends StatelessWidget {
  const listOfFaculity({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
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
         leading:const Icon(Icons.circle),
        //  onTap: (){
        //   Navigator.push(
        //     context,MaterialPageRoute(
        //       builder: (context) => detailInfo(contents),
        //     )
        //   );
        //  },

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
    );
  }
}
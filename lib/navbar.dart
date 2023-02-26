// ignore_for_file: unnecessary_const, prefer_const_constructors


import 'package:bitnavigatormap/screens/allLists.dart';
import 'package:bitnavigatormap/screens/feedback.dart';
import 'package:bitnavigatormap/screens/history.dart';
import 'package:bitnavigatormap/screens/infoAboutBit.dart';
import 'package:bitnavigatormap/screens/listOfOffices.dart';
import 'package:bitnavigatormap/screens/setting.dart';
import 'package:bitnavigatormap/shortlist.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';


class navBar extends StatelessWidget {
  const navBar({super.key, required MaterialColor color});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Colors.black26,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25)
        )
      ),
      child: ListView(
        // ignore: duplicate_ignore
        children:  [
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            child:Container(
            decoration: BoxDecoration(),
            child: Image(image: AssetImage('assets/image/polyimage.jpg')),

            )

          ),

          // ignore: prefer_const_constructors


          SizedBox(height:12),
          ListTile(
            leading: Icon(Icons.home,color: Colors.orange),
            title: Text('Home',style: TextStyle(color: Colors.blue)),

            onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
          ),
           ListTile(
            leading: Icon(Icons.favorite,color: Colors.orange),
            title: Text('Short List',style: TextStyle(color: Colors.blue),),
            onTap: (() => Navigator.push(context, MaterialPageRoute(
              builder: (context) => const shortlist(),
            )
            )
            ),
          ),
           ListTile(
            leading: Icon(Icons.home_max_rounded,color: Colors.orange),
            title: Text('All lists',style: TextStyle(color: Colors.blue)),
            onTap: (() => Navigator.push(context, MaterialPageRoute(
              builder: (context) => const places()),

            )
            ),
          ),
            ListTile(
            leading: Icon(Icons.info,color: Colors.orange,),
            title: Text('About BIT',style: TextStyle(color: Colors.blue)),
            onTap: (() => Navigator.push(context, MaterialPageRoute(
              builder: (context) => const infoAboutBit()),

            )
            ),
          ),
           ListTile(
            leading: Icon(Icons.history,color: Colors.orange),
            title: Text('History',style: TextStyle(color: Colors.blue)),
             onTap: (() => Navigator.push(context, MaterialPageRoute(
              builder: (context) => const history()),

            )
            ),
          ),
           ListTile(
            leading: Icon(Icons.settings,color: Colors.orange),
            title: Text('Setting',style: TextStyle(color: Colors.blue)),
             onTap: (() => Navigator.push(context, MaterialPageRoute(
              builder: (context) => const setting()),

            )
            ),
          ),
           ListTile(
            leading: Icon(Icons.contacts,color: Colors.orange),
            title: Text('Contact',style: TextStyle(color: Colors.blue)),
            // onTap: () => null,
          ),


           ListTile(
            leading: Icon(Icons.feedback,color: Colors.orange),
            title: Text('Feedback',style: TextStyle(color: Colors.blue)),
            onTap: (() => Navigator.push(context, MaterialPageRoute(
              builder: (context) => const submitfeedback(),
            )
            )
            ),
          ),
        ],

      ),

    );
  }
}
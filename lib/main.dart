import 'package:bitnavigatormap/shortlist.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'currentlocation.dart';
import 'homepage.dart';
import 'navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'semister project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController=controller;

  }
   int currentpage=0;

  List <Widget> pages= [currentlocation(),homepage(),shortlist(),];

  Widget appBarTitle=const Text("Bahirdar Institute Of Technology",style: TextStyle(color: Colors.black45,fontSize: 17),);



      Icon actionIcon = const Icon(Icons.search,color: Colors.orange);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller= TextEditingController();

    // List<Contents> searchList= contentList.where((element)
    // => element.name.toLowerCase().contains(text.toLowerCase.toString())).toList();

    return Scaffold(
      drawer: const navBar(color: Colors.orange),
      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: const Icon(Icons.menu),color: Colors.orange,)),
        backgroundColor: Colors.grey.shade100,
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
           onPressed: () {
            setState(() {
              if(actionIcon.icon == Icons.search){
                actionIcon=const Icon(Icons.close,color:Colors.orange);
                appBarTitle=  TextFormField(
                  controller: controller,
                  style: const TextStyle(
                    color:Colors.black45,
                  ),
                  decoration: const InputDecoration(
                    // prefixIcon: Icon(Icons.search,color: Colors.white,),
                    hintText: "search...",
                    hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    border: InputBorder.none,


                  ),
                  // onFieldSubmitted:  (covariant) {
                  //   setState(() {
                  //     text =covariant;
                  //   });
                  // },
                );
                 Positioned(
                  top: 20,
                  child: Container(
                   padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                   ),
                   decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.0),

                  boxShadow: const[
                    BoxShadow(
                      color:Colors.orange,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ]
                   )


                  )



                  ,);
              }
              else{
                actionIcon=const Icon(Icons.search,color:Colors.orange);
                appBarTitle=const Text('Bahirdar Institute Of Technology',style: TextStyle(color: Colors.black45,fontSize: 17));


              }
            });
             },
             )
             ],
             shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
             ),
      ),
      // body: GoogleMap(
      //   onMapCreated: _onMapCreated,
      //   initialCameraPosition: CameraPosition(
      //     target: _center,
      //     zoom: 11.0),
      // )

      body: pages[currentpage],

      bottomNavigationBar: CurvedNavigationBar(

  backgroundColor: Colors.grey.shade100,
  color: Colors.blue,
  animationDuration: const Duration(milliseconds: 200),
    items: const <Widget>[
      Icon(Icons.home, size: 30,color: Colors.orange),
      Icon(Icons.location_on, size: 30,color: Colors.orange),
      Icon(Icons.bookmark, size: 30,color: Colors.orange),
    ],
   onTap: (int index){
        setState(() {
          currentpage=index;

        });
      },

  )


    );
  }
}

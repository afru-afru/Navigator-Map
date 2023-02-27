import 'package:bitnavigatormap/screens/contacts.dart';
import 'package:bitnavigatormap/screens/directions.dart';
import 'package:bitnavigatormap/screens/feedback.dart';
import 'package:bitnavigatormap/screens/infoAboutBit.dart';
import 'package:bitnavigatormap/screens/listOfBuildings.dart';
import 'package:bitnavigatormap/screens/listOfOffices.dart';
import 'package:bitnavigatormap/screens/search.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class currentlocation extends StatelessWidget {
  const currentlocation({super.key});

  @override
  Widget build(BuildContext context) {
    return const firstpage();
  }
}


// ignore: camel_case_types
class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

// ignore: camel_case_types
class _firstpageState extends State<firstpage> {

  Color c1=const Color.fromARGB(255, 129, 131, 134);
  Color c2=const Color.fromARGB(255, 162, 106, 90);
  Color tcolor=const Color.fromARGB(255, 132, 155, 166);
  Color icolor=const Color.fromARGB(255, 115, 106, 95);
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(

       backgroundColor: Colors.grey.shade300,
      body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10,10),
            child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 168
                    //height: 40,
                    //childAspectRatio: width / (height / 4)
                    ),
                children: [
                  InkWell(
                    onTap: () {
                      showSearch(context: context, delegate: DataSearch());
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>  search(),
                      //   ),
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          //boxShadow: const BoxShadow(color: Colors.black),
                          color:c1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(
                            Icons.search,
                            size: 50,
                            color: icolor,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(
                              color: tcolor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //const SizedBox(height: 2,)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const directions(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: c2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(
                            Icons.directions,
                            size: 50,
                            color: icolor,
                          ),
                          Text(
                            'Directions',
                            style: TextStyle(
                              color: tcolor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const homepage2(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: c2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_home_work,
                            size: 50,
                            color: icolor,
                          ),
                          Text(
                            'Buildings',
                            style: TextStyle(
                              color: tcolor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const listOfOffices(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: c1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(
                            Icons.account_balance_outlined,
                            size: 50,
                            color: icolor,
                          ),
                          Text(
                            'Offices',
                            style: TextStyle(
                              color: tcolor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const infoAboutBit(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: c1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info,
                            size: 50,
                            color: icolor,
                          ),
                          Text(
                            'Info',
                            style: TextStyle(
                              color: tcolor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                       onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const submitfeedback(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: c2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(
                            Icons.feedback,
                            size: 50,
                            color: icolor,
                          ),
                          Text(
                            'Feedback',
                            style: TextStyle(
                              color: tcolor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
            )
                ),
    );

  }
}
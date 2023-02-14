import 'package:flutter/material.dart';


class setting extends StatelessWidget {
  const setting({super.key});

  @override
  Widget build(BuildContext context) {
    return settings();
  }
}

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {

  String dropdownvalue = 'English';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'English',
    'Amharic'


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
   iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
    title: const Text('Setting',style: TextStyle(color: Colors.black26),),
    backgroundColor: Colors.grey.shade100,
     shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
             ),
  ),

  body: Column(
    children: <Widget> [

      const Padding(padding: EdgeInsets.fromLTRB(40, 40, 40, 5),
      child: Text('Language',style: TextStyle(color: Colors.orange,fontSize: 20),)),
       Padding(

         padding: EdgeInsets.fromLTRB(40, 0, 40, 40),
         child: DropdownButton(

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(

                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
         ),
       ),
       const Padding(padding: EdgeInsets.fromLTRB(40, 5, 40, 5),
      child: Text('Distace unit',style: TextStyle(color: Colors.orange,fontSize: 20),)),






    ],

  ),
    );
  }
}
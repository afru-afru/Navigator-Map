import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';


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
    'English',
    'Amharic'

];

var items2 = [
    'Km',
    'Cm'

];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
   iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
    title: const Text('Setting',style: TextStyle(color: Colors.brown),),
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
      child: Text('Language',style: TextStyle(color: Colors.brown,fontSize: 20),)),
       Padding(

         padding: EdgeInsets.fromLTRB(40, 0, 40, 40),
         child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            'Select Language',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items
                  .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ))
                  .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonStyleData: const ButtonStyleData(
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
       ),
       const Padding(padding: EdgeInsets.fromLTRB(40, 5, 40, 5),
      child: Text('Distace unit',style: TextStyle(color: Colors.brown,fontSize: 20),)),
       Padding(

         padding: EdgeInsets.fromLTRB(40, 0, 40, 40),
         child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            'Select Unit',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items2
                  .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ))
                  .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonStyleData: const ButtonStyleData(
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
       ),








    ],

  ),
    );
  }
}
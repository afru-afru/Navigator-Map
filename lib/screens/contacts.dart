

import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';




class contacts extends StatelessWidget {
  // can create a controller, and call methods to update source loc,
  // destination loc, interact with the google maps controller to
  // show/hide markers programmatically etc.

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Contact us',style: TextStyle(color: Colors.brown),),
      backgroundColor: Colors.grey.shade100,
      centerTitle: true,
      iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
         shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
             ),),
       bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'BIT',
          textColor: Colors.white,
          backgroundColor: Colors.brown.shade100,
          email: 'bduinfo@bdu.edu.et',
            // textFont: 'Sail',
        ),


      body:  ContactUs(
          logo: AssetImage('assets/image/polyimage.jpg'),
          email: 'bduinfo@bdu.edu.et',
          companyName:  'Bahirdar Institute of technology',
          phoneNumber: '+251 583 20 9653',
          dividerThickness: 2,
          website: 'https://www.bdu.edu.et/node/67',
          githubUserName: 'AbhishekDoshi26',
          linkedinURL: 'https://et.linkedin.com/school/bduethiopia/',
          // tagLine: 'Flutter Developer',
          twitterHandle: 'https://twitter.com/bdueduet', cardColor: Colors.brown.shade100, companyColor: Colors.brown, taglineColor: Colors.grey.shade100, textColor: Colors.brown,companyFontSize: 23,
          // instagramUserName: '_abhishek_doshi',
        ),
    );
  }
}
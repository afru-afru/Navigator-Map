import 'package:bitnavigatormap/screens/contacts.dart';
import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';



class infoAboutBit extends StatelessWidget {
  const infoAboutBit({super.key});

  @override
  Widget build(BuildContext context) {
    return aboutBit();
  }
}

class aboutBit extends StatefulWidget {
  const aboutBit({super.key});

  @override
  State<aboutBit> createState() => _aboutBitState();
}

class _aboutBitState extends State<aboutBit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
    title: const Text('About BIT',style: TextStyle(color: Colors.brown),),
    backgroundColor: Colors.grey.shade100,
     shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
             ),
  ),

      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Background Information",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.brown
                    )),
                // IconButton(
                //   icon: Icon(
                //     Icons.close,
                //   ),
                //   iconSize: 24,
                //   onPressed: () {
                //      Get.back();
                //   },
                // )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(

                   """
   Bahir Dar University was established by merging two former higher education institutions; namely the Bahir Dar Polytechnic and Bahir Dar Teachers’ College. The Bahir Dar Polytechnic Institute, which has transformed itself into Technology and Textile institutes, was established in 1963 under the technical cooperation between the Government of USSR and the Imperial Government of Ethiopia. The institute was a premier institute in producing technicians for the nation. The Bahir Dar Teachers’ College, by then known as the Academy of Pedagogy, was established in 1972 by the tripartite agreement of the Imperial Government of Ethiopia, UNESCO and UNDP and started actual work in the following year under the auspices of the Ministry of Education and Fine Arts.

    Its general objective was to train multipurpose primary education professionals capable of adopting primary education to rural life and rural development.

    Its specific objectives were to train primary school teacher trainers, supervisors, educational leaders, adult education organizers and community development agents.

  The two institutions of higher learning were integrated to form the Bahir Dar University following the Council of Ministers regulation no. 60/1999 GC. The University was inaugurated on May 6, 2000. Bahir Dar University is now among the largest universities in the Federal Democratic Republic of Ethiopia, with more than 52,830 students in its 219 academic programs; 69 undergraduate, 118 masters, and 32 PhD programs; Bahir Dar University has Five colleges, four institutes, two faculties and one school. The academic units of the University include College of Science, College of Agriculture and Environmental Sciences, College of Medical and Health Sciences, College of Business and Economics, College of Education and Behavioral Sciences, Bahir Dar Institute of Technology, Ethiopia Institute of Textile and Fashion Technology, Institute of Land Administration, Institute of Disaster Risk Management and Food Security Studies, Faculty of Humanities, Faculty of Social Sciences, School of Law, Sport academy and Maritime academy. The research centers of the university are Blue Nile water Institute, Biotechnology research Institute, Pedagogy and Education research Institute, Energy research Institute, Textile, garment and fashion design, Abay culture and development research center, Geospatial data and technology center, Institute of Economics research and Demographic surveillance.
            """),
          ),
          GestureDetector(
                  onTap: (){
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  contacts(),
                        ),
                      );

                  },
                  child:  Padding(
                      padding: const EdgeInsets.all(15),
                      child:
                      Container(
                        height: 34,
                        color: Colors.brown.shade100,
                        child: const OutlinedButton(
                          onPressed: null,
                          style: ButtonStyle(),
                          child: Text("wants to contact?"),
                        ),
                      )),
                ),
        ]

        ),
      ),
    );



  }
}
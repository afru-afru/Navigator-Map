import 'package:flutter/material.dart';


class Feedback extends StatelessWidget {
  const Feedback({super.key});

  @override
  Widget build(BuildContext context) {
    return submitfeedback();
  }
}

class submitfeedback extends StatefulWidget {
  const submitfeedback({super.key});

  @override
  State<submitfeedback> createState() => _submitfeedbackState();
}


class _submitfeedbackState extends State<submitfeedback> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
     iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
    title: const Text('Feedback',style: TextStyle(color: Colors.black26),),
    backgroundColor: Colors.grey.shade100,
     shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
             ),
  ),

  body: Form(
    key: _formKey,
            // padding: EdgeInsets.all(15),
            child: Column(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(20.0)),
		borderSide: BorderSide(color: Colors.orange, width: 2),
	   ),
      focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(20.0)),
		borderSide: BorderSide(color: Colors.orange),
	  ),
                      labelText: 'Enter Your Email',
                      hintText: 'Email',

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(

                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      decoration: InputDecoration(
                        labelText: 'Messages',
                         hintText: "Enter Your Messages",
                             enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(30.0)),
		borderSide: BorderSide(color: Colors.orange, width: 2),
	   ),

                         focusedBorder: OutlineInputBorder(
                            	borderRadius: BorderRadius.all(Radius.circular(30.0)),
		                      borderSide: BorderSide(color: Colors.orange),
                         )
                      ),

                   ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),


                  child: OutlinedButton(onPressed: null,
  style: ButtonStyle(

  ),

  child:  Text("submite"),)
                )

              ],
            )
  )
    );
  }
}
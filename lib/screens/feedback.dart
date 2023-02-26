import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialog_alert/dialog_alert.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Feedback extends StatelessWidget {
  const Feedback({super.key});

  @override
  Widget build(BuildContext context) {
    return const submitfeedback();
  }
}

class submitfeedback extends StatefulWidget {
  const submitfeedback({super.key});

  @override
  State<submitfeedback> createState() => _submitfeedbackState();
}

class _submitfeedbackState extends State<submitfeedback> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  var uuid = Uuid();

String _errorMessage='';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.orange,
          ),
          title: const Text(
            'Feedback',
            style: TextStyle(color: Colors.black26),
          ),
          backgroundColor: Colors.grey.shade100,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
        ),
        body: Form(
            key: _formKey,
            // padding: EdgeInsets.all(15),
            child: Column(
              children:  <Widget>[
                 Padding(
                  padding: const EdgeInsets.all(30),
                  child: TextField(
                    controller: email,
                    keyboardType:  TextInputType.emailAddress,
                    decoration: const InputDecoration(
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

                    onChanged: (val){
                validateEmail(val);
              },
                  ),
                ),

                    Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
              child: Text(_errorMessage, style: const TextStyle(color: Colors.red),
              ),
            ),
                 Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: message,
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    decoration: const InputDecoration(
                        labelText: 'Messages',
                        hintText: "Enter Your Messages",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.orange),
                        )),



                  ),

                ),
                GestureDetector(
                  onTap: (){
                    _submitFeedback(email.text, message.text);
                  },
                  child:  Padding(
                      padding: const EdgeInsets.all(15),
                      child:
                      Container(
                        height: 34,
                        color: Colors.lightBlue,
                        child: const OutlinedButton(
                          onPressed: null,
                          style: ButtonStyle(),
                          child: Text("submit"),
                        ),
                      )),
                ),
                   StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance.collection("Feedbacks").snapshots(),

                  builder: (context, snapshot) {

                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                  else{
                    List namex = snapshot.data!.docs;

                   return Text(namex[0]["email"]);
                  }
                  }
                )
              ],
            )));
  }

  void _submitFeedback(String email, String message) async{
    String id = uuid.v4();

    await FirebaseFirestore.instance.collection("Feedbacks").doc(id).set({
      "email": email,
      "message": message,
    });
      showDialogAlert(
  context: context,
  title: 'Success',
  message: 'You have successfully submited your feedback.',
  actionButtonTitle: 'OK',
);

  }

  void validateEmail(String val) {

     if(val.isEmpty){
  setState(() {
    _errorMessage = "Email can not be empty";
  });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    }else{
      setState(() {

        _errorMessage = "";
      });
    }

  }
}

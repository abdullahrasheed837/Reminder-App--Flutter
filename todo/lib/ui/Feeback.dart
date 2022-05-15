import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MeraApp());

class MeraApp extends StatelessWidget {
  MeraApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const appTitle = '             Feedback';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            appTitle,
            textScaleFactor: 1.5,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.feedback,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: const MyCustomForm(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context); // Add your onPressed code here!
          },
          backgroundColor: Color.fromARGB(255, 27, 4, 158),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  TextEditingController NameController = new TextEditingController();
  TextEditingController SubjectController = new TextEditingController();
  TextEditingController MessageController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "\nSubmit your valuable feedback to improve the usability of our application\n",
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Color.fromARGB(255, 1, 13, 117),
                //    backgroundColor: Color.fromARGB(255, 83, 81, 81),
              ),
            ),
          ),
          TextFormField(
            controller: NameController,
            decoration: const InputDecoration(
              icon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 11, 0, 158),
                size: 40,
              ),
              hintText: 'Enter your Name',
              hintStyle: TextStyle(color: Color.fromARGB(255, 72, 0, 155)),
              labelText: 'Name',
              floatingLabelStyle: TextStyle(
                color: Color.fromARGB(255, 25, 0, 136),
                //  fontSize: 26,
              ),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: SubjectController,
            decoration: const InputDecoration(
              icon: const Icon(
                Icons.title,
                color: Color.fromARGB(255, 11, 0, 158),
                size: 40,
              ),
              hintText: 'Enter your Subject',
              hintStyle: TextStyle(color: Color.fromARGB(255, 72, 0, 155)),
              labelText: 'Subject',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Subject';
              }
              return null;
            },
          ),
          TextFormField(
            controller: MessageController,
            decoration: const InputDecoration(
              icon: const Icon(
                Icons.message,
                color: Color.fromARGB(255, 11, 0, 158),
                size: 40,
              ),
              hintText: 'Enter your Message',
              hintStyle: TextStyle(color: Color.fromARGB(255, 72, 0, 155)),
              labelText: 'Message',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Message';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                      'Feedback is submitted',
                      textScaleFactor: 1.3,
                    )),
                  );
                  FirebaseFirestore.instance.collection('Feedbacks').add({
                    'Name': NameController.text,
                    'Subject': SubjectController.text,
                    'Message': MessageController.text,
                  });
                }
              },
              child: const Text(
                'Submit',
                textScaleFactor: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

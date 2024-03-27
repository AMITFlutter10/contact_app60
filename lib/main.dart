import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main()async{
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final fireStore = FirebaseFirestore.instance;
 // task
 //  object vs instance
  sendData() {
    fireStore.collection("note").add({
      "message": massageController.text,
      "time": timeController.text,
    }).then((value) {
      print(value);
    });
  }

  // sendCollection() {
  //   fireStore.collection("TextNote").add({
  //     "message": massageController.text,
  //     "time": timeController.text,
  //   }).then((value) {
  //     print(value);
  //   });
  // }

  getData() {
    fireStore.collection("note").get();
  }


  var massageController = TextEditingController();
  var timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: massageController,
                  decoration: InputDecoration(
                      hintText: "message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  )
              ),
             const   SizedBox(height: 10,),
              TextFormField(
                  controller: timeController,
                  decoration: InputDecoration(
                      hintText: "time",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  )
              ),
              ElevatedButton(onPressed: () {
                setState(() {
                  sendData();
                });
              }, child: Text("Sent"))
            ],
          ),
        )
    );
  }
}
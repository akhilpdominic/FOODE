import 'package:flutter/material.dart';
import 'package:food_tracker/dataCollection.dart';
import 'package:food_tracker/devInfo.dart';
import 'package:food_tracker/firestoreFetch.dart';
import 'package:food_tracker/firestoreHelper.dart';
import 'package:food_tracker/homePage.dart';
import 'package:food_tracker/introPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_tracker/itemAddition.dart';
import 'package:food_tracker/login.dart';
import 'firebase_options.dart';

// ...


Future main() async{
     WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: login(),
    );
  }
}

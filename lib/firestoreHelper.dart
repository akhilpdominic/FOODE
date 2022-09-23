
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_tracker/firestoreFetch.dart';

class firestoreTest extends StatefulWidget {
   const firestoreTest({ Key? key }) : super(key: key);
 
   @override
   State<firestoreTest> createState() => _firestoreTestState();
 }
 
 class _firestoreTestState extends State<firestoreTest> {
   @override
   Widget build(BuildContext context) {
     List<String> docIDs=[];

  Future getid() async
  {
    await FirebaseFirestore.instance.collection('Food_consumption').get().then(
      (snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        docIDs.add(document.reference.id);
      }));
  }


  
  void initState()
  {
    getid();
    super.initState();
  }
     return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 251, 207, 88),
          child: Column(
            children: [
              SizedBox(height: 30,),

              Center(child: Text("Previous Consumption",style: TextStyle(color: Colors.red,fontSize: 25,
              fontWeight: FontWeight.bold),)),

              SizedBox(height: 20,),

              Expanded(child: 
              FutureBuilder(future: getid(),
              builder: (context,snapshot)
              {
                return ListView.builder(itemCount: docIDs.length,
                itemBuilder: (context,index)
                {
                  return ListTile(
                  
                    //title: Text(docIDs[index]),
                    title: getFirestoredata(documentid: docIDs[index])
                  );
                });
              },))

            ],
          ),
        ),
      ), 
     );
   }
 }
 

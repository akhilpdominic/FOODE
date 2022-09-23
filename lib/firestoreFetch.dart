import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';



class getFirestoredata extends StatelessWidget {

  final String documentid;
 
  

  getFirestoredata({required this.documentid});
 

  @override
  Widget build(BuildContext context) {
   


    CollectionReference fooddata=FirebaseFirestore.instance.collection('Food_consumption');
    
    
    
    return FutureBuilder<DocumentSnapshot>(
      future: fooddata.doc(documentid).get(),
      builder: ((context,snapshot)
      {
        if(snapshot.connectionState==ConnectionState.done)
        {
          Map<String,dynamic> data=snapshot.data!.data() as Map<String, dynamic>;
          //print(data['distance'].runtimeType);
            return Card(
              child: 
            SizedBox(
              width: 400,
              height: 150,
              child: Text("Item name: ${data['Item_name']}\nItem count: ${data['Item_count']}\ndate: ${data['date']}\nMeal: ${data['Meal']}\nCalories: ${data['calories']}",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            
            );
          
        }
        return Text('Loading..');
      }
      ));
  }
}
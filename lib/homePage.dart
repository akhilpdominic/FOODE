import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_tracker/calorieViewer.dart';
import 'package:food_tracker/devInfo.dart';
import 'package:food_tracker/firestoreHelper.dart';
import 'package:food_tracker/itemAddition.dart';
import 'package:intl/intl.dart';

class homePage extends StatefulWidget {
  const homePage({ Key? key }) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  
  


  int s=0;

  
  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
   
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height*0.49,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 251, 207, 88)
            ),
          ),
          SafeArea(child: 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60,),
                Text("Eat Healthy!\nStay Healthy!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),

                SizedBox(height: 120,),

                
                Expanded(
                  child: GridView.count(crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    GestureDetector(
                      onTap: (() async => {
                        s=await gettotalcal(),
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => productAdd()))
                        //FirebaseAuth.instance.signOut()
                      }),
                      
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 236, 232, 201),
                          borderRadius: BorderRadius.circular(13)
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.add_to_photos_sharp,
                            size: 100,),
                            Text('Add meal')
                          ],
                        ),
                      
                      ),
                    ),
                     
                    
                     GestureDetector(
                      onTap: (() => {

                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => firestoreTest()))
                        //FirebaseAuth.instance.signOut()
                      }),
                       child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 236, 232, 201),
                          borderRadius: BorderRadius.circular(13)
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.food_bank_outlined,
                            size: 100,
                            ),
                            Text("Meals History")
                          ],
                        ),
                                         ),
                     ),


                     GestureDetector(
                      onTap: (() async => {
                        s=await gettotalcal(),
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => calorieViewer(s)))
                        //FirebaseAuth.instance.signOut()
                      }),
                      
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 236, 232, 201),
                          borderRadius: BorderRadius.circular(13)
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.dining_sharp,
                            size: 100,),
                            Text('Total calorie today')
                          ],
                        ),
                      
                      ),
                    ),

                   GestureDetector(
                      onTap: (() => {

                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => devInfo()))
                        //FirebaseAuth.instance.signOut()
                      }),
                       child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 236, 232, 201),
                          borderRadius: BorderRadius.circular(13)
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.food_bank_outlined,
                            size: 100,
                            ),
                            Text("Developer info")
                          ],
                        ),
                                         ),
                     ),


                  ],),
                )


              ],
            ),
          )),

        ],
      ),

    
      
    );
  }
}


Future<int> gettotalcal() async
{
      String date=DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
      int a=0;
      List<int> list = []; 
      var snap = await FirebaseFirestore.instance.collection('Food_consumption').where('date', isEqualTo: date).get();
      for ( var stop in snap.docs){
      list.add( (stop.data() as Map<String,dynamic>)["calories"]);

      for(var i in list)
      {
        a=a+i;
      }
      }
      return a;
}

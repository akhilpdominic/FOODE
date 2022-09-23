import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class productAdd extends StatefulWidget {
  const productAdd({ Key? key }) : super(key: key);

  @override
  State<productAdd> createState() => _productAddState();
}

class _productAddState extends State<productAdd> {
    final _itemnameController=TextEditingController();
  final _itemcountController=TextEditingController();
  final _caloriesController=TextEditingController();
  final _mealController=TextEditingController();
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        
        child: 
        SingleChildScrollView(
          
          child: Container(

            child: Column(
              children: [
                Text('Enter food item details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 60,),
                SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText:"Item Name",
                          ),
                          controller: _itemnameController,
                          )),
                       SizedBox(height: 40,),
        
        
        
                       SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText:"Quantity (Bowl/number)"),
                          controller: _itemcountController,
                          )),
                       SizedBox(height: 40,),
        
                        
        
                       SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText:"Meal (breakfast/lunch/dinner)"),
                          controller: _mealController,
                          )),
                       SizedBox(height: 40,),
        
                       Center(
                        child: OutlinedButton(
            
                        onPressed: ()
                        {
                          addDetails(_itemnameController.text, int.parse(_itemcountController.text), _caloriesController.text, _mealController.text );
                          Navigator.pop(context);

                        },
                        style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.red[200],
                      minimumSize: Size(300,55),
                      textStyle: const TextStyle(fontSize: 20,color: Colors.black),
                      ),
                        
                        
                        child: const Text("Submit"),
                      
                    ),
                      )
        
                
              ],
            ),
          ),
        )
      ),
    );
  }
}


Future<void> addDetails(String itemname,int itemcount,String calorie,String meal) async {

    await FirebaseFirestore.instance.collection('Food_consumption').add(
    {
      'Item_name':itemname,
      'Item_count':itemcount,
      'Meal':meal,
      'date':DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
      'calories':(await getcal(itemname))*itemcount
    }
  );
  
}

Future<int> getcal(String itemname) async
{
      int a=0;
      List<int> list = []; 
      var snap = await FirebaseFirestore.instance.collection('Food_Details').where('Name', isEqualTo: itemname).get();
      for ( var stop in snap.docs){
      list.add( (stop.data() as Map<String,dynamic>)["Calorie"]);

      for(var i in list)
      {
        a=i;
      }
      }
      return a;
}
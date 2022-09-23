import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class dataEntry extends StatefulWidget {
  const dataEntry({ Key? key }) : super(key: key);

  @override
  State<dataEntry> createState() => _dataEntryState();
}

class _dataEntryState extends State<dataEntry> {

final _nameController=TextEditingController();
final _genderController=TextEditingController();
final _veganController=TextEditingController();
final _gymController=TextEditingController();
final _emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: Color.fromARGB(255, 251, 207, 88)
,
                
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(child: Text("Enter the details",style: (TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),)),
                      SizedBox(height: 50,),
                      
                    
                
                      SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText:"Name"),
                          controller: _nameController,)),
                       SizedBox(height: 40,),
            
                        SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText:"Email"),
                          controller: _emailController,)),
                       SizedBox(height: 40,),
            
                
                      SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText:"Gender"),
                          controller: _genderController,
                          )),
                
                       SizedBox(height: 40,),
                
                       SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText:"Are you a vegan? (Yes/No)"),
                          controller: _veganController,
                          )),
                
                       SizedBox(height: 40,),
                
                         SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText:"Do you go to the gym (Yes/No)"),
                          controller: _gymController,
                          )),
                
                      
                      SizedBox(height: 110,),
                      
                      
                      Center(
                        child: OutlinedButton(
                
                        onPressed: ()
                        {
                          addDetails(_nameController.text,_emailController.text,_genderController.text, _veganController.text, _gymController.text );
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
              ),
            ),
          ),
        
      
    );
  }
}

Future<void> addDetails(String name,String email,String gender,String vegan,String gym) async {


    
    await FirebaseFirestore.instance.collection('Member details').add(
    {
      'name':name,
      'email':email,
      'gender':gender,
      'vegan':vegan,
      'Gym membership':gym,
    }
  );
}
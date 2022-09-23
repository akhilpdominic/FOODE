import 'package:flutter/material.dart';

const List<String> list1 = <String>['Yes','No'];
String dropdownValue = list1.first;

class introPage extends StatefulWidget {
  const introPage({ Key? key }) : super(key: key);

  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
              Center(
                child: Text("FOO APP",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
              ),

              SizedBox(
                height: 80,
              ),



              Center(
                child: Text("Welcome to FOO",style: 
                TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              ),
              Center(
                child: Text("Your personal food companion",style: 
                TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                child: Text("Lets get started with the setup\n\n\nAre you a vegan?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              ),

              SizedBox(height: 50),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(           
                  style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.blue[900],
                  minimumSize: Size(50,25),
                  textStyle: const TextStyle(fontSize: 10,color: Colors.black),
                  ),
                  onPressed: null,
                
                  child: Text("Yes",style: 
                  TextStyle(color: Colors.white),)),

              SizedBox(
                width: 130,
              ),

              OutlinedButton(           
                  style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.blue[900],
                  minimumSize: Size(50,25),
                  textStyle: const TextStyle(fontSize: 10,color: Colors.black),
                  ),
                  onPressed: null,
                
                  child: Text("No",style: 
                  TextStyle(color: Colors.white),)),
                ],
              )
              

            ],
          ),
        ),
      ),
    );
  }
}
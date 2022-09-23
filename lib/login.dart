import 'package:flutter/material.dart';
import 'package:food_tracker/dataCollection.dart';
import 'package:food_tracker/homePage.dart';


class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(255, 251, 207, 88),
          child: Center(
            child: Column(
              children: [
                
                SizedBox(height: 100,),
                Text('FOODE',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ),),
                Text("Your personal food companion",style: 
                TextStyle(
                  color: Colors.blue[800],
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: EdgeInsets.only(
                    top: 100
                  ),
                  child: OutlinedButton(           
                    style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.blue[900],
                    minimumSize: Size(300,55),
                    textStyle: const TextStyle(fontSize: 20,color: Colors.black),
                    ),
                    onPressed: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => homePage())
                    );

                  }, 
                    child: Text("Login",style: 
                    TextStyle(color: Colors.white),)),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 25
                  ),
                  child: OutlinedButton(           
                    style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.orange[900],
                    minimumSize: Size(300,55),
                    textStyle: const TextStyle(fontSize: 20,color: Colors.black),
                    ),
                    onPressed: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => dataEntry())
                    );
                    

                  }, 
                    child: Text("Register",style: 
                    TextStyle(color: Colors.white),)),
                ),





               
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
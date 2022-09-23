import 'package:flutter/material.dart';

class calorieViewer extends StatefulWidget {
  int s=0;
  calorieViewer(this.s);
  @override
  State<calorieViewer> createState() => _calorieViewerState();
}

class _calorieViewerState extends State<calorieViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 251, 207, 88),
          child: Center(
            child: 
            Text("Total Calorie intake : ${widget.s}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),
          ),
        ),
      ),
      
    );
  }
}
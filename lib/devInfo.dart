import 'package:flutter/material.dart';

class devInfo extends StatefulWidget {
  const devInfo({ Key? key }) : super(key: key);

  @override
  State<devInfo> createState() => _devInfoState();
}

class _devInfoState extends State<devInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text('Developed by',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 40,),
                Text('Akhil P Dominic',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 110,),

                Text('Technology used',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 40,),
                Text('Flutter\n\nFirebase\n\nFirestore database',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
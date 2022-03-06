import 'package:flutter/material.dart';

class creditBuilding extends StatelessWidget {
  const creditBuilding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex:6,
              child: Container(
                width: double.infinity,
                color: Colors.indigo[200],

              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                color: Colors.white,

              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 45.0,),
              Text(
                'Smart Waste System',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'of Shoubra faculty of Engineering',
                style: TextStyle(

                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30.0,),
              Text(
                'Simply save your time by going to the proper trash bin according to your current location',
                style: TextStyle(
                ),
              ),
              SizedBox(height: 50.0,),
              Text(
                'Tell us where you are !',
                style: TextStyle(
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                width: 80.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white12

                ),
                child: Material(
                  elevation: 50.0,
                  child: Container(
                      child: Center(child: Text('1st floor'))),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

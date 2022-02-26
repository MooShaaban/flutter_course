import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {


  double result = 0;
  int age = 20;
  bool isMale = true;

  BMIResult({
    required this.result,
    required this.age,
    required this.isMale,

});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Age : $age',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0
              ),
            ), //age
            Text(
              'Result : ${result.round()}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
              ),
            ), //result
            Text(
              'gender :  ${isMale? 'Male' : 'Female'}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
              ),
            ), //gender
          ],
        ),
      ),
    );
  }
}

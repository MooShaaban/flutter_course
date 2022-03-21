import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

class BinDescriptionVisitor extends StatelessWidget {


  double percent = 60.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsetsDirectional.all(15.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(image: AssetImage('assets/images/Bin1.png'),
                  height: 320.0,
                ),
              ),
              SizedBox(height: 10.0,),
              Text('Bin Description',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0,),
              Text('More Info.'),
              SizedBox(height: 10.0,),
              RoundedProgressBar(
                childCenter: Text(
                  '$percent%',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                height: 35.0,
                percent: percent,
                style: RoundedProgressBarStyle(
                    colorProgress: Colors.teal,
                    colorProgressDark: Colors.teal.shade600,
                    backgroundProgress: Colors.teal.shade100
                ),

              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Material(
                  elevation: 8.0,
                  color: Colors.transparent,
                  child: Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: MaterialButton(
                      onPressed: (){},
                      child: Text(
                        'Get location',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

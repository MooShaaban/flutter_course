import 'package:flutter/material.dart';

class CreditBuilding extends StatefulWidget {
  const CreditBuilding({Key? key}) : super(key: key);

  @override
  State<CreditBuilding> createState() => _CreditBuildingState();
}

class _CreditBuildingState extends State<CreditBuilding> {
   bool animation = false;

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
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 45.0,),
              const Text(
                'Smart Waste System',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'of Shoubra faculty of Engineering',
                style: TextStyle(

                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 30.0,),
              const Text(
                'Simply save your time by going to the proper trash bin according to your current location',
                style: TextStyle(
                ),
              ),
              const SizedBox(height: 50.0,),
              const Text(
                'Tell us where you are !',
                style: TextStyle(
                ),
              ),
              const SizedBox(height: 30.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      buildFloorItem(floorNumber: 1, floorName: 'First floor',onTap: (){}),
                      SizedBox(height: 20.0,),
                      buildFloorItem(floorNumber: 2, floorName: 'Second floor',onTap: (){}),
                      SizedBox(height: 20.0,),
                      buildFloorItem(floorNumber: 3, floorName: 'Third floor',onTap: (){}),
                      SizedBox(height: 20.0,),
                      buildFloorItem(floorNumber: 4, floorName: 'Fourth floor',onTap: (){}),
                    ],
                  ),
                  SizedBox(width: 25.0,),
                  Column(
                    children: [
                      buildFloorItem(floorNumber: 5, floorName: 'Fifth floor',onTap: (){}),
                    ],
                  ),

                  // AnimatedOpacity(
                  //   opacity: animation? 1 : 0,
                  //   duration: const Duration( milliseconds: 500),
                  //   child: Column(
                  //     children: [
                  //       buildFloorItem(floorNumber: 1, floorName: 'First floor',onTap: (){}),
                  //       SizedBox(height: 20.0,),
                  //       buildFloorItem(floorNumber: 2, floorName: 'Second floor',onTap: (){}),
                  //       SizedBox(height: 20.0,),
                  //       buildFloorItem(floorNumber: 3, floorName: 'Third floor',onTap: (){}),
                  //       SizedBox(height: 20.0,),
                  //       buildFloorItem(floorNumber: 9, floorName: 'I am here',onTap: (){}),
                  //     ],
                  //   ),
                  // ),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }

  Widget buildFloorItem ({
    required int floorNumber,
    required String floorName,
    required void Function() onTap,
}){

    return Material(
      color: Colors.transparent,
      elevation: 10.0,
      child: Container(
        width: 150.0,
        height: 45.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.deepPurple[50]
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10.0,),
              Container(
                width: 30.0,
                height: 27.0,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[500],
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Center(
                  child: Text(
                    '$floorNumber',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0,),
              Text(
                '$floorName',
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:remontada2/sws_project/visitor/mainstream_building.dart';

import 'credit_building.dart';

class SWSHome extends StatefulWidget {
  const SWSHome({Key? key}) : super(key: key);

  @override
  State<SWSHome> createState() => _SWSHomeState();
}

class _SWSHomeState extends State<SWSHome> {

  int screenIndex = 0;
  List<Widget> screen =[
    CreditBuilding(),
    MainStreamBuilding(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(

        padding: EdgeInsetsDirectional.all(12.0),



        child: Material(
          color: Colors.transparent,
          elevation: 10.0,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.transparent,
            ),
            child: BottomNavigationBar(


              selectedFontSize: 23.0,
              unselectedFontSize: 15.0,
              type: BottomNavigationBarType.fixed,
              currentIndex: screenIndex,
              onTap: (index){
                setState(() {
                  screenIndex = index;
                });

              },
              fixedColor: Colors.deepPurple[500],
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    height: 0.0,
                    width: 0.0,
                  ),
                  title:Text(
                    'Credit Building',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                BottomNavigationBarItem(
                    icon:  Container(
                      height: 0.0,
                      width: 0.0,
                    ),
                    title: Text(
                      'Mainstream Building',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    )
                ),
              ],
            ),
          ),
        ),
      ),
      body: screen[screenIndex],

    );
  }
}

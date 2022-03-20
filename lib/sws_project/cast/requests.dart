import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_icon_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:remontada2/sws_project/cast/bin_description.dart';

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index)=> buildItem(),
      separatorBuilder: (context, index)=> SizedBox(height: 1.0,),
      itemCount: 10,
    );

  }

  Widget buildItem () {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 10,
        color: Colors.transparent,
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: GestureDetector(
            onTap: () {
              print('jjjj');

              Navigator.push(context, MaterialPageRoute(builder: (context)=>BinDescription()));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/images/bin0.jpg'),
                  width: 110.0,
                  height: 110.0,
                  fit: BoxFit.contain,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.0,),
                    Text(
                      'Bin Description',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Text('Capacity 70%'),
                    SizedBox(height: 10.0,),
                    Container(
                      width: 220.0,
                      child: RoundedProgressBar(
                        percent: 70.0,
                        height: 22.0,
                        style: RoundedProgressBarStyle(
                            colorProgress: Colors.teal,
                            colorProgressDark: Colors.teal.shade600,
                            backgroundProgress: Colors.teal.shade100


                        ),
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

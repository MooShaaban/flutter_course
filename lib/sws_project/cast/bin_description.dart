import 'package:flutter/material.dart';


class BinDescription extends StatefulWidget {
  const BinDescription({Key? key}) : super(key: key);

  @override
  State<BinDescription> createState() => _BinDescriptionState();
}

class _BinDescriptionState extends State<BinDescription> {

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
              // RoundedProgressBar(
              //   childCenter: Text(
              //       '$percent%',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold
              //     ),
              //   ),
              //   height: 35.0,
              //   percent: percent,
              //   style: RoundedProgressBarStyle(
              //     colorProgress: Colors.teal,
              //     colorProgressDark: Colors.teal.shade600,
              //     backgroundProgress: Colors.teal.shade100
              //   ),
              //
              // ),
              SizedBox(height: 15.0,),
              Row(
                children: [
                  SizedBox(width: 5.0,),
                  Expanded(
                    flex: 1,
                    child: Material(
                      elevation: 8.0,
                      color: Colors.transparent,
                      child: Container(
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
                  SizedBox(width: 10.0,),
                  Expanded(
                    flex: 1,
                    child: Material(
                      elevation: 8.0,
                      color: Colors.transparent,
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: MaterialButton(
                          onPressed: (){},
                          child: Text(
                            'On my way',
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
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Material(
                  elevation: 8.0,
                  color: Colors.transparent,
                  child: Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        setState(() {
                          percent = 0.0;
                        });
                      },
                      child: Text(
                        'Reset capacity',
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

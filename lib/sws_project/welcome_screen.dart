import 'package:flutter/material.dart';
import 'package:remontada2/sws_project/cast/all_bins.dart';
import 'package:remontada2/sws_project/cast/login_sws.dart';
import 'package:remontada2/sws_project/cast/staff_home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/images/welcome0.jpg'),
              height: 330.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Smart Waste System',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Of compound x',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Save your time by heading to a suitable, safe and nearest trash bin based on your current location.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Go ahead and press Get Started button below to start',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 45.0,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent[200],
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: MaterialButton(
                        onPressed: (){},
                        child: Text(
                            'Get Started',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.indigo[300],
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Login_SWS()));
                        },
                        child: Text(
                          'Staff Member?',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )




          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Counter'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: (){
                  setState(
                          () {
                            counter--;
                            print(counter);
                  }
                  );
                },
                child: Text('MINUS'
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                  '$counter',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 50.0
                ),
              ),
            ),
            TextButton(
                onPressed: (){
                  setState(() {
                    counter++;
                    print(counter);
                  });

                },
                child: Text(
                    'PLUS'
                )
            )
          ],
        ),
      ),

    );
  }
}
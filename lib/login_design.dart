import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginDesign extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Login Screen'),
      ),
      body: SingleChildScrollView(
        child: Container(

          width: double.infinity,
          padding: EdgeInsetsDirectional.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150.0,),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value){
                  print(value);
                },
                onFieldSubmitted: (value){
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'Email Adress',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail_outline),

                ),
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),


                ),
              ),
              SizedBox(height: 10.0,),
              MaterialButton(
                minWidth: double.infinity,
                child: Text('Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                  color: Colors.deepPurple,
                  onPressed: (){}
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account ?'),
                  TextButton(onPressed: (){}, child: Text('Register Now'))

                ],
              )
            ],
          ),
        ),
      ),

    );
  }

}
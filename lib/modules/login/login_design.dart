import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remontada2/shared/components/components.dart';

class LoginDesign extends StatelessWidget{


  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
          padding: EdgeInsetsDirectional.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 130.0,),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 30.0,),
              TextFormField(
                controller: emailController,
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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),


                ),
              ),
              SizedBox(height: 10.0,),
              defaultButton(
                  text: 'Login',
                  function: (){
                    print(emailController.text) ;
                    print(passwordController.text);
                  },
                backgroundColor: Colors.deepPurpleAccent,
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
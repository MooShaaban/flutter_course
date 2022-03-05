import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton ({
  required String text,
  Color backgroundColor = Colors.blue,
  required Function() function,
  double height = 40.0,
  double width = double.infinity,
  bool isUpperCase = true,
  double radius = 0,
}) {

     return Container(
       height: height,
       width: width,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(radius),
         color: backgroundColor,
       ),
       child: MaterialButton(
          child: Text(isUpperCase? text.toUpperCase() : text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),

          onPressed: function,
        ),
     );
}




Widget defaultFormFeild({
  required TextEditingController controller,
  TextInputType keyboard = TextInputType.text,
  void Function(String)? onChanged,
  required void Function(String)? onSubmitted,
  required String? Function(String?) validator,
  required String label,
  required Icon prefix,
  IconButton? suffix ,
  bool isPassword = false,
  void Function()? ontap,

})

=> TextFormField(
  obscureText: isPassword? true : false,
  controller: controller,
  keyboardType: keyboard,
  onChanged: onChanged,
  onFieldSubmitted: onSubmitted,
  validator: validator,
  onTap: ontap,


  decoration: InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
    prefixIcon: prefix,
    suffixIcon: suffix,

  ),
);
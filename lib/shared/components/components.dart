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



Widget buildTaskItem({
  required Map model,
}){
  return Padding(
    padding: const EdgeInsetsDirectional.only(bottom: 15.0,top: 5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30.0,
          child: Text(
            '${model['time']}',
            style: TextStyle(
              fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        SizedBox(width: 15.0,),
        Container(
          height: 60.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
              SizedBox(height: 5.0,),
              Text(
                '${model['date']}',
                style: TextStyle(
                    color: Colors.grey
                ),

              ),
            ],
          ),
        ),
      ],
    ),
  );
}
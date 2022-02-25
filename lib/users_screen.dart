import 'package:flutter/material.dart';

class UserModel{
  final int id;
  final String name;
  final String phone;

  UserModel({
   required this.id,
   required this.name,
   required this.phone,
});
}

class UsersScreen extends StatelessWidget {

  List<UserModel> users = [
    UserModel(id: 1, name: 'MohamedShaaban', phone: '01060954945'),
    UserModel(id: 2, name: 'Ahmed Abdullah', phone: '01098376797'),
    UserModel(id: 3, name: 'Mohamed Arafa', phone: '01030112030'),
    UserModel(id: 1, name: 'MohamedShaaban', phone: '01060954945'),
    UserModel(id: 2, name: 'Ahmed Abdullah', phone: '01098376797'),
    UserModel(id: 3, name: 'Mohamed Arafa', phone: '01030112030'),
    UserModel(id: 1, name: 'MohamedShaaban', phone: '01060954945'),
    UserModel(id: 2, name: 'Ahmed Abdullah', phone: '01098376797'),
    UserModel(id: 3, name: 'Mohamed Arafa', phone: '01030112030'),
    UserModel(id: 1, name: 'MohamedShaaban', phone: '01060954945'),
    UserModel(id: 2, name: 'Ahmed Abdullah', phone: '01098376797'),
    UserModel(id: 3, name: 'Mohamed Arafa', phone: '01030112030'),
    UserModel(id: 1, name: 'MohamedShaaban', phone: '01060954945'),
    UserModel(id: 2, name: 'Ahmed Abdullah', phone: '01098376797'),
    UserModel(id: 3, name: 'Mohamed Arafa', phone: '01030112030'),
    UserModel(id: 1, name: 'MohamedShaaban', phone: '01060954945'),
    UserModel(id: 2, name: 'Ahmed Abdullah', phone: '01098376797'),
    UserModel(id: 3, name: 'Mohamed Arafa', phone: '01030112030'),
    UserModel(id: 1, name: 'MohamedShaaban', phone: '01060954945'),
    UserModel(id: 2, name: 'Ahmed Abdullah', phone: '01098376797'),
    UserModel(id: 3, name: 'Mohamed Arafa', phone: '01030112030')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index)=> buildUserItem (users[index]) ,
          separatorBuilder: (context, index)=>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey,
            ),
          ),
          itemCount: users.length)

    );
  }
  Widget buildUserItem (UserModel user)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0
            ),
          ),
        ),
        SizedBox(width: 12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4,),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


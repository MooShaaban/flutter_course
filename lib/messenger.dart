import 'package:flutter/material.dart';

class Messenger extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/267477836_4407093582751549_8371535749456077451_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=pE0W163Rg2wAX9UeM-u&_nc_ht=scontent.fcai19-4.fna&oh=00_AT_VP78jNVuWB0RhK9IkOAgNW4X63XkgZYerA5C40ufZ-Q&oe=621A54C2'),
            ),
            SizedBox(width: 10,),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0
              ),
            ),

          ],
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: CircleAvatar(
                backgroundColor: Colors.grey,
                  radius: 16.0,
                  child: Icon(

                      Icons.camera_alt,
                    color: Colors.white,
                  )
              )),
          IconButton(onPressed: (){},
              icon: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 16.0,
                  child: Icon(

                    Icons.edit,
                    color: Colors.white,
                  )
              )),
        ],


      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),

                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(),

                  ),
                ),
              ),
              SizedBox(height: 12.0,),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index)=>buildStoryItem(),
                    separatorBuilder: (context, index)=>SizedBox(width: 15.0,),
                    itemCount: 10,
                ),
              ),
              SizedBox(height: 20,),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index)=>buildChatItem(),
                  separatorBuilder:(context, index)=>SizedBox(height: 12.0,) ,
                  itemCount: 15
              ),

            ],
          ),
        ),
      ),
    );

  }
  Widget buildChatItem()=>Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage('https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/267477836_4407093582751549_8371535749456077451_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=pE0W163Rg2wAX9UeM-u&_nc_ht=scontent.fcai19-4.fna&oh=00_AT_VP78jNVuWB0RhK9IkOAgNW4X63XkgZYerA5C40ufZ-Q&oe=621A54C2'),
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleAvatar(
                radius: 9.0,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),

            ],
          )
        ],
      ),
      SizedBox(width: 12.0,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mohamed Shaaban ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0,),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello there my name is Mohamed Shaaban',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,

                  ),
                ),
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  '11:50',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),

          ],
        ),
      ),

    ],
  );
  Widget buildStoryItem()=>Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/267477836_4407093582751549_8371535749456077451_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=pE0W163Rg2wAX9UeM-u&_nc_ht=scontent.fcai19-4.fna&oh=00_AT_VP78jNVuWB0RhK9IkOAgNW4X63XkgZYerA5C40ufZ-Q&oe=621A54C2'),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CircleAvatar(
                  radius: 9.0,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),

              ],
            )
          ],
        ),
        Text(
          'Abdullah Shaaban',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 13.0
          ),
        ),
      ],
    ),
  );

}
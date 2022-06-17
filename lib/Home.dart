import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/postcard.dart';
import 'package:untitled4/stories.dart';

import 'addpost.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List PostList = [];
  List users = [
    "your story",
    "amal90",
    "sara12",
    "aala",
    "as_00",
    "ill_7",
    "amal90",
    "sara12",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  Stack(
      children: [

        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "img/download.png",
                  width: 110,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_box_outlined,
                        color: Colors.black,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Addpost()));
                      },
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Icon(
                      Icons.chat_outlined,
                      color: Colors.black,
                      size: 28,
                    )
                  ],
                )
              ],
            ),
          ),
          body: Body(),
        )
      ],
    );
  }

  Widget Body() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      ///Stories
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 130.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Stories(text: users[index]);
                })),
      ),

      ///Posts
      SizedBox(
        height: 500,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Post').snapshots(),
          builder: (context, snapshot) {
            PostList.clear();
            if (snapshot.hasData) {
              snapshot.data.docs.forEach((DC) {
                PostList.add({
                  'Caption': DC["Caption"],
                  'docId': DC.id,
                  'imgUrl': DC['imgUrl']
                });
              });
              return ListView.builder(
                itemCount: PostList.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    Caption: PostList[index]['Caption'],
                    docId: PostList[index]['docId'],
                    imgUrl: PostList[index]['imgUrl'],
                  );
                },
              );
            } else
              return Container();
          },
        ),
      ),
    ]);
  }
}

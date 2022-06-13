import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'explore.dart';
import 'stories.dart';

class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List highlights = ["✨", "💕", " أسئلة و شروحات", "💙👩🏻‍🎓", "كيف تعلمت ابرمج","☕","نصائح برمجية"];
  List PostList = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "amal_codes ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.add_box_outlined,
                    color: Colors.black,
                    size: 28,
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 28,

                  )
                ],
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 20),
              child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                /// profile pic
                Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                      color: Colors.grey[400],
                      //border: Border.all(width: 2, color: Colors.pinkAccent),
                      shape: BoxShape.circle,
                    )),

                ///numbers of post,follower,following

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "6",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "881",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Follwers",
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "749",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Following",
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),

            ///name and bio
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "amal_code",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " FLUTTER DEVELOPER 👩‍💻 \n",
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      height: 38,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Edit profile",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 38,
                      width: 40,
                      child: Icon(Icons.person_add_outlined),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey[300],
                      ),
                    ),
                  )
                ],
              ),
            ),
            ///highlight
            Container(
                height: 130,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: highlights.length,
                    itemBuilder: (context, index) {
                      return Stories(text: highlights[index]);
                    })),

            TabBar(tabs: [


              Icon (Icons.grid_view,color: Colors.black,),
              Icon (Icons.person,color: Colors.black,),


            ]),
            ///posts
            Container(child: Explore(),height: 300,width: double.infinity,)

          ]),
        ),
      ),
    );
  }
}



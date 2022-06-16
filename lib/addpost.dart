import 'dart:io';

import 'package:flutter/material.dart';

import 'Upload/Storage.dart';
import 'class.dart';
import 'ِAuth/auth.dart';

class Addpost extends StatefulWidget {
  @override
  _AddpostState createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  var Caption = TextEditingController();
  var imgUrl;
  database db = new database();
  Auth auth = new Auth();
  File image;
  Storage _storage = new Storage();
  var name;
  bool like = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(size),
      body: Body(),
    );
  }

  Widget appBar(size) {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    ("New Post "),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.blue,
                  size: 30,
                ),
                onPressed: () async {
                  if (image != null) {
                    imgUrl = await _storage
                        .uploadFile(image, context)
                        .then((value) => value);
                    print(imgUrl);
                    //  print(image.path);
                  } else
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("No Image was selected")));
                  db.ADD(
                    Caption: Caption.text.trim(),
                    imgUrl: imgUrl,
                    context: context,
                  );
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }

  Widget Body() {
    return SingleChildScrollView(
      child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            Row(
              children: [
                /// add caption
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 260,
                      height: 45,
                      child: TextField(
                          controller: Caption,
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                            hintText: 'Write a caption...',
                          ))),
                ),
                ///add picture
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                      // alignment: Alignment.center,

                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey,
                        child: image == null
                            ? Icon(
                                Icons.image,
                                size: 30,
                                color: Colors.white,
                              )
                            : Image.file(
                                image,
                                fit: BoxFit.fill,
                              ),
                      ),
                      onTap: () async {
                        _storage.getImage(context).then((file) {
                          setState(() {
                            image = File(file.path);
                            print(file.path);
                          });
                        });
                      }),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      //                    <--- top side
                      color: Colors.grey.shade200,
                      width: .5,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Tag people",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
                )),
            Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  border: Border(
                    ///  top side
                    top: BorderSide(
                      color: Colors.grey.shade200,
                      width: .5,
                    ),
                    /// top side
                    bottom: BorderSide(
                      color: Colors.grey.shade200,
                      width: .5,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Add location",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
                )),
            Padding(padding: EdgeInsets.only(top: 12)),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Also post to",
                    style: TextStyle(fontSize: 16),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Facebook",
                        style: TextStyle(fontSize: 16),
                      )),
                ),
                IconButton(
                    icon: Icon(
                      Icons.toggle_off_outlined,
                      color: Colors.grey,
                      size: 35,
                    ),
                    onPressed: () {}
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Twitter",
                        style: TextStyle(fontSize: 16),
                      )),
                ),
                IconButton(
                    icon: Icon(
                      Icons.toggle_off_outlined,
                      color: Colors.grey,
                      size: 35,
                    ),
                    ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Tumblr",
                        style: TextStyle(fontSize: 16),
                      )),
                ),
                IconButton(
                    icon: Icon(

                      Icons.toggle_off_outlined,
                      color: Colors.grey,
                      size: 35,
                    ),
                    onPressed: () {
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Advanced settings",
                        style: TextStyle(fontSize: 16),
                      )),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ],
            ),

          ],
        ),

    );
  }
}

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
      body: Body(size),
    );
  }

  Widget appBar(size) {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: SizedBox(
            width: 10,
            child: Text(
              ("Add Post "),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget Body(size) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
            ),
            Row(
              children: [
                GestureDetector(
                    // alignment: Alignment.center,

                    child: Container(
                      height: 140,
                      width: 180,
                      color: Colors.grey,
                      child: image == null
                          ? Icon(
                              Icons.image,
                              size: 50,
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                ),
                Container(
                    width: 300,
                    height: 45,
                    child: TextField(
                        controller: Caption,
                        decoration: InputDecoration(
                          hintText: ' Your Caption...',
                        ))),

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            TextButton(
                child: Text(
                  'ADD',
                  style: TextStyle(
                      color: Colors.black54,
                      letterSpacing: .5,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
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
}

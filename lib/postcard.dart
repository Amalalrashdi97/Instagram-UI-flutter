import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled4/theme.dart';

import 'activebar.dart';

class PostCard extends StatelessWidget {
  var Caption;
  var index;
  File image;
  var imgUrl;
  var docId;
  bool like=false;

  PostCard({this.Caption,this.like,
    this.index, this.docId, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    print(imgUrl);
    return Column(
      children: [
        Container(

          child: Row(
            children: [
              SizedBox(width: 10),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: bgStoryColors),
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Color(0xffff4657)),
                    image: DecorationImage(
                        image: AssetImage("img/aftar.jpg"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(width: 10),
              Text(
                ("amal_codes"),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 210),
              Icon(FontAwesome.ellipsis_v, size: 18),
            ],
          ),

        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(height: 1,width: double.infinity,color: Colors.grey.shade200,),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            child:Container(child: imgUrl ==null?Icon(Icons.image,size: 50,):Image.network(imgUrl),
            width: double.infinity,
            height: 200,
          ),
        ),),
        SizedBox(height: 10),


        ///below the post ----> buttons and comments
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite,color: Colors.red,size: 25,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      Icons.mode_comment_outlined,size: 25,
                    ),
                  ),
                  Icon(Icons.share,size: 25,)
                ],
              ),
              Icon(Icons.bookmark,size: 25,)
            ],
          ),
        ),

        ///comment
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text("liked by "),
              Text(
                "amal_codes ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("and "),
              Text(
                "others ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        ///caption

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: "ama_codes",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                        Caption),
                  ],
                ),
              ),

            ),
          ],
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}

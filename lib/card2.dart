import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled4/theme.dart';

import 'activebar.dart';

class Card2 extends StatelessWidget {
  var Caption;
  var index;
  File image;
  var imgUrl;
  var docId;
  bool like=false;

  Card2({this.Caption,this.like,
    this.index, this.docId, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    print(imgUrl);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            child:Container(child: imgUrl ==null?Icon(Icons.image,size: 50,):Image.network(imgUrl),
              width: 150,
              height: 150,
            ),
          ),),


      ],
    );
  }
}

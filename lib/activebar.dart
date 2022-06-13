import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ActivityBar extends StatefulWidget {

  @override
  _ActivityBarState createState() => _ActivityBarState();
}

class _ActivityBarState extends State<ActivityBar> {

  bool isPressed=false;
  @override
  Widget build(BuildContext context) {
    return Row(

        children: [
          IconButton(
            icon: new Icon(isPressed
                ? Icons.favorite
                : FontAwesomeIcons.heart),
            color: isPressed ? Colors.red : Colors.black,
            onPressed: () {
              setState(() {
                isPressed = !isPressed;
              });
            },

          ),
          new SizedBox(
            width: 10.0,
          ),
          new Icon(
            FontAwesomeIcons.comment,
          ),
          new SizedBox(
            width: 16.0,
          ),
          new Icon(FontAwesomeIcons.paperPlane,),
          SizedBox(width: 250,),
          new Icon(FontAwesomeIcons.bookmark),
        ]);
  }
}

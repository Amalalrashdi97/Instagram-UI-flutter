import 'package:flutter/material.dart';

class MyWidget {
  Color maincolor = const  Color(0xff7A68B5);
  Widget myTextField({lblName, @required TextEditingController controller}) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            child: Text(
              '$lblName',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            )),
        Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        )
      ],
    );
  }

  Widget myMainButton({@required VoidCallback onPress, @required btnName}) {
    return ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // <-- Radius
          ),),
          backgroundColor:MaterialStateProperty.resolveWith((states) => maincolor),
          minimumSize: MaterialStateProperty.resolveWith((states) => const Size(350.0,48.0)),
        ),
        child: Text('$btnName',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)

    );
  }

  Widget mySecondButton({@required  onPress, @required btnName}) {
    return TextButton(
        onPressed: onPress,
        style: ButtonStyle(

          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // <-- Radius
          ),),
          side: MaterialStateProperty.all(BorderSide(color: maincolor,width: 2)),
          backgroundColor:MaterialStateProperty.resolveWith((states) => Colors.white),
          minimumSize: MaterialStateProperty.resolveWith((states) => const Size(350.0,48.0)),
        ),
        child: Text('$btnName',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xff7A68B5)),)

    );
  }

}

import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  var text;
  var  imagee;

  Stories( {this.text,this.imagee} );
  @override
  Widget build(BuildContext context) {
    return
              Padding(

                  padding: EdgeInsets.all(6.5),
                child:Column(
                  children: [
                    Container(
                        width: 64.0,
                        height: 64.0,
                        decoration: new BoxDecoration(
                          color: Colors.grey[400],
                          border: Border.all(width: .2, color: Colors.grey),
                          shape: BoxShape.circle,
                                image: new DecorationImage(

                                  image: new AssetImage('img/aftar.jpg'),
                                  fit: BoxFit.fill,
                                )
                            )

                        ),

                    SizedBox(height: 10),
                    Text(text),
                  ],
                )







    );
  }
}

import 'package:flutter/material.dart';
class Explore extends StatefulWidget {

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 18,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context,index){
        return Padding(padding: EdgeInsets.all(.5),
        child: Container(color: Colors.grey[300],),);
        });
  }
}

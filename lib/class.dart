import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled4/%D9%90Auth/auth.dart';




class database {
  FirebaseFirestore fire = FirebaseFirestore.instance;
  Auth auth=new Auth();

  CollectionReference users = FirebaseFirestore.instance.collection('Post');
  Future ADD({
    @required Caption,
    @required imgUrl,
    @required BuildContext context,userId, }) async {
    await users.doc(userId).set({
      'Caption': Caption,
      'time': Timestamp.now(),
      'imgUrl':imgUrl,


    }).then((value) {
      print("SUCCESS");
    }).catchError((e) {
      print(e.code);
    });
  }

  Future <Stream>getpost() async {
    final userId =await auth.currentUser().then((value) => value);
    Stream data =fire.collection('Post').doc(userId).snapshots();
    return data;
  }

}


class MASSAGERCONTROLLER {
  database db = new database();
  Future ADD({@required Caption,@required imgUrl,@required BuildContext context}) async {
    await db.ADD(Caption: Caption,imgUrl: imgUrl,context: context );
    print(Caption);
  }
}


import 'package:flutter/cupertino.dart';

import 'class.dart';

class MASSAGERCONTROLLER {
  database db = new database();
  Future ADD({@required Caption,@required imgUrl,@required BuildContext context}) async {
    await db.ADD(Caption: Caption,imgUrl: imgUrl,context: context );
  }
}


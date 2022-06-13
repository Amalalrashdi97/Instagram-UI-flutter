import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:untitled4/%D9%90Auth/auth.dart';

import 'loginpage.dart';
class RegisterPage extends StatelessWidget {
  var password = TextEditingController();
  var email = TextEditingController();
  var name = TextEditingController();
  var phoneNum = TextEditingController();
  Auth _auth = new Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Container(
                    width: 200,
                    height: 100,
                    child: Image.asset("img/download.png")),
                SizedBox(
                  height: 30,
                ),

                Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey.shade100,
                  ),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey.shade100,
                  ),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey.shade100,
                  ),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey.shade100,
                  ),
                  child: TextField(
                    controller: phoneNum,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'phone No',
                    ),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    child: Container(
                      width: 350,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.blue.shade500,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    onPressed: ()async{
                      var user=await _auth.createUserWithEmailAndPassword(context,email.text.trim(), password.text.trim(),name.text.trim(),phoneNum.text.trim()).then((value) => value);
                      if(user!=null)
                        SuccessAlertBox(context: context,title: 'Success',messageText: 'You have Register Successfully');

                    },
                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 60,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade800,
                  height: .5,
                ),
                SizedBox(
                  height:10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account? ",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    TextButton( onPressed: ()  {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()));},
                      child:  Text(
                        "Sign in",
                        style: TextStyle(
                            color: Color(0xFF111D40),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),)

                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

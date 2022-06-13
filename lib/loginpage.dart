import 'package:flutter/material.dart';
import 'package:headup_loading/headup_loading.dart';
import 'package:untitled4/%D9%90Auth/auth.dart';
import 'package:untitled4/Home.dart';
import 'package:untitled4/register.dart';

class HomePage extends StatelessWidget {
  var password = TextEditingController();
  var email = TextEditingController();
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
                  height: 20,
                ),
                TextButton(
                    onPressed: () async {
                      final userId = await _auth
                          .signInWithEmailAndPassword(
                              context, email.text.trim(), password.text.trim())
                          .then((value) => value);

                      if (userId != null)
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                    },
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
                          "Log In",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot your login details?",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    Text(
                      "Get help logging in.",
                      style: TextStyle(
                          color: Color(0xFF111D40),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      color: Colors.grey.shade800,
                      height: .5,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 150,
                      color: Colors.grey.shade800,
                      height: .5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "img/face.png",
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Log in with Facebook",
                      style: TextStyle(
                          color: Colors.blue.shade500,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: Color(0xFF111D40),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

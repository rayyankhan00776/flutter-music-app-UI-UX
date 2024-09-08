// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_system/screens/dashboard_screen.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<loginpage> {
  bool changebutton = false;
  String name = "";
  bool namechanged = false;
  final _formkey = GlobalKey<FormState>();

  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });

      await Future.delayed(Duration(seconds: 2));
      await Navigator.push(
          context, MaterialPageRoute(builder: ((context) => dashboard())));
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    "Pics/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "W E L C O M E ",
                  style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 30)),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Center(
                child: Text(
                  "$name",
                  style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 27)),
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Container(
                width: 300,
                height: 90,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text("ENTER YOUR USERNAME"),
                    hintText: "USERNAME",
                    prefixIcon: Icon(Icons.mail),
                  ),
                  onChanged: (valuee) {
                    if (valuee != Null && valuee.isNotEmpty) {
                      namechanged = true;
                      name = valuee;
                      setState(() {});
                    }
                  },
                  validator: (valuee) {
                    if (valuee!.isEmpty) {
                      return "UserName Cant be Empty";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: 300,
                height: 90,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      label: Text("ENTER YOUR PASSWORD"),
                      hintText: "PASSWORD",
                      prefixIcon: Icon(Icons.lock)),
                  validator: (valuee) {
                    if (valuee!.isEmpty) {
                      return "password Cant be Empty";
                    } else if (valuee.length < 6) {
                      return "enter 6 length password";
                    }
                    return null;
                  },
                ),
              ),
              InkWell(
                onTap: () => movetohome(context),
                child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: changebutton ? 40 : 50,
                    width: changebutton ? 40 : 110,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(5, 5),
                              blurRadius: 2,
                              spreadRadius: 1),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-5, -5),
                              blurRadius: 4,
                              spreadRadius: 2),
                        ],
                        borderRadius:
                            BorderRadius.circular(changebutton ? 25 : 10)),
                    child: Center(
                        child: changebutton
                            ? Icon(
                                Icons.done,
                                color: Colors.black,
                              )
                            : Text(
                                "Login",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 18, color: Colors.black)),
                              ))),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

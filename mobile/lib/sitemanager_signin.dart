// ignore: unused_import
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/supplier_dashboard.dart';

import 'package:mobile/supplier.dart';
import 'sitemanager_dashboard.dart';
import 'sitemanager_forgotpassword.dart';
import 'supplier_signin.dart';

class SitemanagerSignIn extends StatefulWidget {
  const SitemanagerSignIn({Key? key}) : super(key: key);

  @override
  _SitemanagerSignInState createState() => _SitemanagerSignInState();
}

class _SitemanagerSignInState extends State<SitemanagerSignIn> {
  final _formKey = GlobalKey<FormState>();

  Future save() async {
    var res = await http.post("http://localhost:5000/user/userlogin",
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'userEmail': user.userEmail,
          'userPassword': user.userPassword
        });
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => SitemanagerDashboard()));
  }

  Color textfieldcolor = Colors.blue;
  User user = User("", "", "", "","", "", "", "");
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text("Site Manager",
      ),
      
    ),
      body: SingleChildScrollView(
        child: Container(
          
          color: Colors.blue,
          height: size.height,
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                ),
              ),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                  height: size.height / 3,
                                  width: size.width,
                                  child: Image.asset("images/sitemanagersignin.png")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                
                                controller:
                                    TextEditingController(text: user.userEmail),
                                onChanged: (value) {
                                  user.userEmail = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Email';
                                  } else if (RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                    return null;
                                  } else {
                                    return 'Please enter valid email!';
                                  }
                                },
                                
                                style: TextStyle(color: Colors.black),

                                decoration: InputDecoration(
                                  prefixIcon: Image.asset("icons/email.png"),
                                  labelText: "Email",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: textfieldcolor),
                                  fillColor: Colors.blue.shade50,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: TextEditingController(
                                    text: user.userPassword),
                                onChanged: (value) {
                                  user.userPassword = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset("icons/password.png"),
                                  labelText: "Password",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: textfieldcolor),
                                  fillColor: Colors.blue.shade50,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 245),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  SitemanagerForgotpassword()));
                                    },
                                    child: Text(
                                      "Forgot Password ?",
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Colors.blue.shade800),
                                      textAlign: TextAlign.right,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                              child: Container(
                                height: 60,
                                width: 400,
                                child: FlatButton(
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        save();
                                      } else {
                                        print("no");
                                      }
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: GoogleFonts.workSans(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 220),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) => SupplierSignIn()));
                                    },
                                    child: Text(
                                      "Sign in as a Supplier ?",
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Colors.blue.shade800),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

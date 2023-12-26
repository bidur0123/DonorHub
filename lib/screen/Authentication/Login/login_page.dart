import 'dart:convert';

import 'package:donor_hub/handler/providers.dart';
import 'package:donor_hub/screen/Authentication/Signup/signup_page.dart';
import 'package:donor_hub/screen/entering_screen/entering_page.dart';
import 'package:donor_hub/screen/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(bool? isDonor, {Key? key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<Providers>(context).user;
    bool isDonor = Provider.of<Providers>(context).isDonor;
    String status = isDonor ? "Donor" : "Medical Personnel";
    Future<List?> login(bool isDonor) async {
      Uri myUri = Uri.parse("http://192.168.1.30/bloodbuddy/donor_login.php");
      final response = await http.post(myUri, body: {
        "email": email.text,
        "password": password.text,
        //"status": status,
      });
      var datauser = json.decode(response.body);

      if (datauser != '"hiçbir veri post edilmedi"') {
        print("başarılı olmalı");
        print(datauser);

        setState(() {
          if (isDonor) {
            var currentUser = Provider.of<Providers>(context, listen: false)
                .currentUser(datauser);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const TestStartingScreen()));
          } else {
            var currentUser = Provider.of<Providers>(context, listen: false)
                .currentUser(datauser);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const ContactDonor()));
          }
        });
      } else {
        Fluttertoast.showToast(
            msg: "This user does not exists. Try again or sign up!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 20.0);
      }
      setState(() {
        email.text = datauser[0]['first_name'];
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white70),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EnteringPage()),
            )),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              matchTextDirection: true,
              repeat: ImageRepeat.noRepeat,
              image: AssetImage("assets/images/images.png"),
            )),
        child: SafeArea(
          child: Center(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFormField(
                          controller: email,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            prefixIcon: Icon(Icons.email),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontFamily: 'Roboto',
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFormField(
                          controller: password,
                          textAlign: TextAlign.start,
                          obscureText: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            prefixIcon: Icon(Icons.lock),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              fontFamily: 'Roboto',
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                        width: 30,
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () async {
                          print(email.text);
                      //    login(isDonor);

                          try {
                            if (true) {
                              setState(() {});
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                  "Şifre veya Email yanlış. Lütfen tekrar dene",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 20.0);
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          backgroundColor: const Color(0xFFDE2828),
                          padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp(isDonor)));
                          });
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          backgroundColor: const Color(0xFFDE2828),
                          padding: const EdgeInsets.fromLTRB(60, 5, 70, 10),
                        ),
                        child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TestStartingScreen()));
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          backgroundColor: const Color(0xFFDE2828),
                          padding: const EdgeInsets.fromLTRB(60, 5, 70, 10),
                        ),
                        child: const Text(
                            'Goto',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

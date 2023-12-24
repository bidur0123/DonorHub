import 'package:donor_hub/handler/providers.dart';
import 'package:donor_hub/screen/Authentication/Login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp(bool? isDonor, {Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController hostpital = TextEditingController();
  TextEditingController blood = TextEditingController();
  String Year = '';
  String Month = '';
  String Date = '';
  bool isDateSelected = false;

  @override
  Widget build(BuildContext context) {
    bool isDonor = Provider.of<Providers>(context).isDonor;

    Future<List?> register() async {
      var url = "http://192.168.1.30/bloodbuddy/donor_register.php";

      var url_donor = "http://192.168.1.30/bloodbuddy/donor.php";
      var url_staff = "http://192.168.1.30/bloodbuddy/hospital_staff.php";
      var url_blodd = "http://192.168.1.30/bloodbuddy/blood.php";
      Uri myUri = Uri.parse(url);
      Uri myUri_donor = Uri.parse(url_donor);
      Uri myUri_staff = Uri.parse(url_staff);
      Uri myUri_blood = Uri.parse(url_blodd);
      var response;
      var response_blood;
      var response_staff;
      String donor = "Donor";
      String staff = "Medical Personnel";
      if (!isDonor) {
        response = await http.post(myUri, body: {
          "first_name": first_name.text,
          "last_name": last_name.text,
          "password": password.text,
          "status": staff,
          "Year": Year,
          "Month": Month,
          "Date": Date,
          "phone": phone.text,
          "email": email.text,
          "address": address.text,
        });
      } else {
        response = await http.post(myUri, body: {
          "first_name": first_name.text,
          "last_name": last_name.text,
          "password": password.text,
          "status": donor,
          "Year": Year,
          "Month": Month,
          "Date": Date,
          "phone": phone.text,
          "email": email.text,
          "address": address.text,
        });
        response_blood = await http.post(myUri_blood, body: {
          "blood_type": blood.text,
        });
      }

      Fluttertoast.showToast(
        msg: "Account created successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 20.0,
      );

      try {
        setState(() {
          bool isDonor = true;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage(isDonor)),
          );
        });
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'DonorHub',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.white])),
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white10.withOpacity(0.6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: first_name,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "First Name",
                          labelStyle: TextStyle(
                            color: Colors.white,
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
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: last_name,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Last Name",
                          labelStyle: TextStyle(
                            color: Colors.white,
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
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: email,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.white,
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
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: phone,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Phone Number",
                          labelStyle: TextStyle(
                            color: Colors.white,
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
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: address,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Address",
                          labelStyle: TextStyle(
                            color: Colors.white,
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
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: dob,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Date Of Birth",
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1600),
                                lastDate: DateTime(2030),
                              ).then((date) {
                                setState(() {
                                  if (date != null) {
                                    isDateSelected = true;
                                    Year = date.year.toString();
                                    Month = date.month.toString();
                                    Date = date.day.toString();
                                    dob.text = "$Year-$Month-$Date";
                                  }
                                });
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (isDonor)
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: TextFormField(
                          controller: blood,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: "Blood Type",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    if (!isDonor)
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: TextFormField(
                          controller: hostpital,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: "Hospital Name",
                            labelStyle: TextStyle(
                              color: Colors.white,
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
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: password,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            )),
                      ),
                      onPressed: () async {
                        register();
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
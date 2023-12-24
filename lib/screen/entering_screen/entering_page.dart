import 'package:donor_hub/handler/providers.dart';
import 'package:donor_hub/screen/Authentication/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnteringPage extends StatefulWidget {
  const EnteringPage({Key? key}) : super(key: key);

  @override
  _EnteringPageState createState() => _EnteringPageState();
}

class _EnteringPageState extends State<EnteringPage> {
  @override
  Widget build(BuildContext context) {
    bool? isDonor = Provider.of<Providers>(context).isDonor;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "DonorHub",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(171, 39, 39, 1.0),
            ),
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.white, Colors.white])),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "Welcome to DonorHub",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/cute.png',
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    isDonor = Provider.of<Providers>(context, listen: false)
                        .changeToHospitalStaff(false);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage(isDonor)));
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    backgroundColor: const Color.fromRGBO(171, 39, 39, 1.0),
                    padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
                  ),
                  child: const Text('Continue As a Staff',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    isDonor = Provider.of<Providers>(context, listen: false)
                        .changeToHospitalStaff(true);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage(isDonor)));
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    backgroundColor: const Color.fromRGBO(171, 39, 39, 1.0),
                    padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
                  ),
                  child: const Text('Continue As a Donor',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

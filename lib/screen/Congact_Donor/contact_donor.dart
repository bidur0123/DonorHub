import 'dart:convert';

//hospital personnel
import 'package:donor_hub/screen/Drawer_screen/staff_drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ContactDonor extends StatefulWidget {
  const ContactDonor({Key? key}) : super(key: key);

  @override
  _ContactDonorState createState() => _ContactDonorState();
}

class _ContactDonorState extends State<ContactDonor> {
  List donorList = [200];

  // List blood=["A-","A+","B+","B+","AB+","B-","B+","A+","A+","0-"];
  List blood = [];
  List cities = [];
  List phone = [];

  getAllTransactions() async {
    var url = "http://192.168.1.30/bloodbuddy/allContact";

    Uri myUri = Uri.parse(url);

    var response = await http.get(myUri);

    if (response.statusCode == 200) {
      setState(() {
        blood = json.decode(response.body);
        print(blood);
      });
      //print(userList);
      return blood;
    }
  }

  getAllAdress() async {
    var url2 = "http://192.168.1.30/bloodbuddy/contactAdress";

    Uri myUri2 = Uri.parse(url2);

    var response2 = await http.get(myUri2);
    if (response2.statusCode == 200) {
      setState(() {
        cities = json.decode(response2.body);
        print(cities);
      });
      //print(userList);
      return cities;
    }
  }

  getAllPhone() async {
    var url2 = "http://192.168.1.30/bloodbuddy/contactphone";

    Uri myUri2 = Uri.parse(url2);

    var response2 = await http.get(myUri2);
    if (response2.statusCode == 200) {
      setState(() {
        phone = json.decode(response2.body);
        print(phone);
      });
      //print(userList);
      return phone;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTransactions();
    getAllAdress(); //list all suers
    getAllPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: StaffDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(171, 39, 39, 1.0),
        title: const Text('Contact Donor'),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: phone.length,
        //donorList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                tileColor: const Color.fromRGBO(206, 203, 203, 1.0),
                leading: Text(
                  blood[index]['blood_type'] ?? 'no data',
                  style: const TextStyle(
                      color: Color.fromRGBO(171, 39, 39, 1.0),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                //Text(donorList[index]['blood type']),
                title: Text(cities[index]['address'] ?? 'no data'),
                //Text(donorList[index]['name']),
                //subtitle
                trailing: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () async {
                      final number = phone[index]['phone'] ?? "555";
                      await FlutterPhoneDirectCaller.callNumber(number);
                    },
                    child: const Text('Call')),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:donor_hub/screen/Drawer_screen/donor_drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowRequest extends StatefulWidget {
  const ShowRequest({super.key});

  @override
  _ShowRequestState createState() => _ShowRequestState();
}

List requestList = [];
List requestBloodType = [];

class _ShowRequestState extends State<ShowRequest> {

  getAllRequest() async {
    Uri url_request =
        Uri.parse("http://192.168.1.30/bloodbuddy/allRequestAdress");
    var response = await http.get(url_request);
    if (response.statusCode == 200) {
      setState(() {
        requestList = json.decode(response.body);
        print(requestList);
      });
      print(requestList);
      return requestList;
    }
  }

  getAllRequestBloodType() async {
    Uri url_requestBloodType =
        Uri.parse("http://192.168.1.30/bloodbuddy/allRequest");
    var response = await http.get(url_requestBloodType);
    if (response.statusCode == 200) {
      setState(() {
        requestBloodType = json.decode(response.body);
        print(requestBloodType);
      });
      print(requestBloodType);
      return requestBloodType;
    }
  }

  @override
  void initState() {
    super.initState();
    getAllRequest();
    getAllRequestBloodType();
  }

  //final bloodRequestRef = Firestore.instance.collection('request');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DonorDrawer(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(171, 39, 39, 1.0),
          title: const Text("Blood Requests"),
        ),
        body: ListView.builder(
          itemCount: requestList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2.0,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Stack(
                        children: <Widget>[
                          SizedBox(
                              height: 120.0,
                              width: 100.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.black87,
                                      alignment: Alignment.center,
                                      child: Text(requestList[index]["address"],
                                          style: const TextStyle(
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: Colors.red,
                                      child: Text(
                                          requestBloodType[index]["blood_type"],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    //Icon(Icons.hdr_strong, color: Colors.redAccent,)
                                    Text(
                                      requestBloodType[index]["amount"] ??
                                          ' ' + "pin Blood Needed",
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Gotham",
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

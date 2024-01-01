import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

//this is the home page that all users are listed
class TransactionResult extends StatefulWidget {
  const TransactionResult({Key? key}) : super(key: key);

  @override
  State<TransactionResult> createState() => _TransactionResultState();
}

List transactionList = [];

class _TransactionResultState extends State<TransactionResult> {
  getAllTransactions() async {
    print("wheree");
    Uri myUri = Uri.parse(
        "http://192.168.1.30/bloodbuddy/allTransaction.php");
    var response = await http.get(myUri);
    if (response.statusCode == 200) {
      setState(() {
        transactionList = json.decode(response.body);
        print(transactionList);
      });
      //print(userList);
      return transactionList;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTransactions(); //list all suers
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DonorDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(171, 39, 39, 1.0),
        title: const Text('Past Actions '),
      ),
      body: ListView.builder(
          itemCount: transactionList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  leading: Text(transactionList[index]["donor_id"],
                      style:
                          const TextStyle(color: Colors.white, fontSize: 30)),
                  title: Text(transactionList[index]["recipient_name"],
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20)),
                  subtitle: Row(children: [
                    Text(
                        transactionList[index]["date_out"] ??
                            'date not entered',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                    const SizedBox(width: 20),
                    Text(
                        transactionList[index]["quantity"] ??
                            'quantity not entered',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15))
                  ]),
                ),
              ),
            );
          }),
    );
  }
}

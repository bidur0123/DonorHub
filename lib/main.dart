import 'package:donor_hub/handler/providers.dart';
import 'package:donor_hub/screen/entering_screen/entering_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Providers()), // Replace 'CHANGE_ME' with the actual implementation of your Providers class
        // Add other providers as needed
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: const EnteringPage(),
      ),
    );
  }
}

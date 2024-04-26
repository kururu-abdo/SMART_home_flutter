import 'package:flutter/material.dart';
import 'package:smart_devices_app/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
       primaryColor: Colors.black,
       
       
        useMaterial3: true,
      ),
      home: const Dashboard()
    );
  }
}

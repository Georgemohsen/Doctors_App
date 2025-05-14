import 'package:flutter/material.dart';
import 'package:flutter_doctors_app/pages/doctor_page.dart';
import 'package:flutter_doctors_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DoctorPage(), debugShowCheckedModeBanner: false);
  }
}

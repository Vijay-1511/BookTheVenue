import 'package:flutter/material.dart';
import 'package:seminarbooking/widget/admin_page.dart';
import 'package:seminarbooking/widget/booking_page.dart';
import 'package:seminarbooking/widget/home_page.dart';
import 'package:seminarbooking/widget/login_page.dart';
import 'package:seminarbooking/widget/page.dart';
import 'package:seminarbooking/widget/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seminar Hall Booking',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/admin',
      routes: {
        '/signup_page': (context) => SignupPage(),
        '/login_page': (context) => LoginPage(),
        '/admin': (context) => AdminDashboardPage(),
        '/page': (context) => ButtonWithImagePage(),
        '/home_page': (context) => HomePage(), // Home page route
        '/booking_page': (context) => BookingPage(), // Booking page route
      },
    );
  }
}

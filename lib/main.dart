import 'package:flutter/material.dart';
import 'package:rajamark_app/dashboard/dashboard.dart';
import 'package:rajamark_app/dashboard/user_manual.dart';
import 'constant/constant.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RajaMark',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => const DashboardPage(),
        '/user-manual': (context) => const UserManual(),
      },
    );
  }
}
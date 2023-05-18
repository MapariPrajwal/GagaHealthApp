// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gagahealth/Pages/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 80.0, right: 80, top: 160, bottom: 80),
          child: Image.asset(
            "Images/basic_plan.png",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "Welcome",
            textAlign: TextAlign.center,
            style: GoogleFonts.nobile(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        //Subtitle
        Text(
          "Health First",
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),

        const Spacer(),

        //Get Started
        GestureDetector(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8.0)),
            child: const Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

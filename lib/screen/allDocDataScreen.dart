import 'package:flutter/material.dart';

class AllDoctorScreen extends StatelessWidget {
  final String title;
  const AllDoctorScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Column(
        children: [
          Text('ass'),
        ],
      ),
    );
  }
}

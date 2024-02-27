import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  // final int id;
  final String name;
  final String uname;
  final String email;
  // final String address;

  const Details(
      {super.key,
      required this.name,
      // required this.address,
      required this.uname,
      // required this.id,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
    );
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:users_api/Screens/UserDetails.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List <dynamic> users =[];
  @override
  void initState() {
    
    super.initState();
    fetchusers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Users",style: TextStyle(fontWeight: FontWeight.w400),)),
      ),
      body: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        final id = user['id'];
        final username = user['username'];
        final name = user['name'];
        final email = user['email'];
        final phone = user['phone'];
        final company_name = user['company']['name'];
        final website = user['website'];
    
      return GestureDetector(
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> UserDetail(id: id, name: name, email: email, phone: phone, companyName: company_name, website: website, username: username,) ));},
        child: Card(
          elevation: 10,
          margin: EdgeInsets.all(8),
          child: Column(children: [
            Text(id.toString()),
            Text(name),
            Text(email),
            Text(phone),
            Text(company_name),
            Text(website),
            
            
          ],),
        ),
      );
    })
    );
  }

  void fetchusers() async{
    const url = "https://jsonplaceholder.typicode.com/users";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json;
      print("users fetched");
    });
  }

  void fetchposts() async{
    const url = "https://jsonplaceholder.typicode.com/users";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json;
      print("users fetched");
    });
  }
}
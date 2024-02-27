import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:users_api/Screens/details.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("profile", style: TextStyle(color: Colors.white)),
            backgroundColor: const Color.fromARGB(255, 70, 46, 37)),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            // final id = user['id'];
            final name = user['name'];
            final uname = user['username'];
            final email = user['email'];
            // final address = user['address'];
            final companyname = user['company']['name'];
            final companyDetail = user['company']['catchPhrase'];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(
                          name: name,
                          // address: address,
                          uname: uname,
                          // id: id,
                          email: email),
                    ));
              },
              child: Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.all(20),
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image(
                          image: NetworkImage(
                              "https://is1-ssl.mzstatic.com/image/thumb/Purple122/v4/95/e1/6b/95e16be7-1c32-32fa-499f-5094219c5ed8/AppIcon-0-0-1x_U007emarketing-0-6-0-0-85-220.png/1200x600wa.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          uname,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Working in " + companyname,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          companyDetail,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  void getData() async {
    const url = "https://jsonplaceholder.typicode.com/users";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json;
    });
  }
}
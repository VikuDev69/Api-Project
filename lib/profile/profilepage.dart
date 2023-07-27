import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Username",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: Colors.amberAccent,
                    child: CircleAvatar(
                      radius: 50,
                      //here we use profile image from API
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text("Email", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Text("Name", style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 15),
                  child:
                      Text("Last Name", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 1),
              child: Text("Gender", style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 1),
              child: Text("Email", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

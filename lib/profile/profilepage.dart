import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final List profilelist;
  const ProfilePage({super.key, required this.profilelist});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    print(widget.profilelist);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.alternate_email_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_box_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ))
        ],
        title: Text(
          "${widget.profilelist[0]['username']}",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(56),
                        color: Colors.white),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff962fbf),
                                Color(0xfffeda75),
                                Color(0xfffa7e1e),
                                Color(0xffd62976),
                                Color(0xff962fbf),
                                Color(0xff4f5bd5),
                              ]),
                          // borderRadius: BorderRadius.circular(40),
                          shape: BoxShape.circle),
                      child: Container(
                        margin: EdgeInsets.all(0),
                        child: CircleAvatar(
                          radius: 50,
                          //here we use profile image from API
                          backgroundColor: Colors.white,

                          foregroundImage: NetworkImage(
                              "${widget.profilelist[0]['image']},"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 25,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("0",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("Posts", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 25,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("310",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("Followers",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("30",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("Following",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Text("${widget.profilelist[0]['firstName']}",
                      style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 15),
                  child: Text("${widget.profilelist[0]['lastName']}",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 1),
              child: Text("${widget.profilelist[0]['gender']}",
                  style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 1),
              child: Text("${widget.profilelist[0]['email']}",
                  style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    elevation: 12,
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    color: Color(0xff363636),
                    onPressed: () {},
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 0),
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    elevation: 12,
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    color: Color(0xff363636),
                    onPressed: () {},
                    child: const Text(
                      "Share Profile",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 0),
                    child: MaterialButton(
                        padding: EdgeInsets.all(8),
                        minWidth: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        elevation: 12,
                        color: Color(0xff363636),
                        onPressed: () {},
                        child: const Icon(
                          Icons.person_add_outlined,
                          color: Colors.white,
                        ))),
              ],
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 36,
                          backgroundColor: Colors.grey,
                          child: CircleAvatar(
                            radius: 34,
                            backgroundColor: Colors.black87,
                            foregroundColor: Colors.grey,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "HighLights",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:getapiexamplle/api/apiserviice.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getdata();
    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "User Data",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
          child: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              width: 200.0,
              height: 100.0,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade600,
                child: const Text(
                  'Loading Data',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.deepPurple.shade100,
                    splashColor: Colors.deepPurple,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "${snapshot.data?[index]['id'].toString()}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    subtitle: Text(snapshot.data?[index]['title']),
                    leading: FutureBuilder(
                        future: getImage(),
                        builder: (context, snapshot) {
                          return CircleAvatar(
                            child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${snapshot.data?[index]['url'].toString()}")),
                          );
                        }),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        snapshot.data?[index]['completed'] == true
                            ? const Icon(
                                Icons.check_box_rounded,
                                color: Colors.blue,
                              )
                            : const Icon(Icons.check_box_outlined)
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}

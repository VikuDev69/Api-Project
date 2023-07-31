import 'package:flutter/material.dart';
import 'package:getapiexamplle/profile/profilepage.dart';
import '../api/apiserviice.dart';

class LogingPage extends StatefulWidget {
  const LogingPage({super.key});

  @override
  State<LogingPage> createState() => _LogingPageState();
}

class _LogingPageState extends State<LogingPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        body: Form(
          key: formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Login Here",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: TextFormField(
                    controller: _usernameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        // suffixIcon: suffixIcon,
                        prefixIcon: const Icon(Icons.person),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.grey[500])),
                    // ignore: body_might_complete_normally_nullable
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Can not Be Empty';
                      } else if (RegExp("kminchelle").hasMatch(value) != true) {
                        return 'enter valid Username';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          // suffixIcon: suffixIcon,
                          prefixIcon: const Icon(Icons.lock),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey[500])),
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Can not Be Empty';
                        } else if (RegExp("0lelplR").hasMatch(value) != true) {
                          return 'Invalid Password';
                        }
                      }),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      var alldata = await loginapi(
                          _usernameController.text.toString(),
                          _passwordController.text.toString());

                      if (alldata != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (context) => ProfilePage(
                              profilelist: alldata,
                            ),
                          ),
                          (route) =>
                              false, //if you want to disable back feature set to false
                        );
                      }
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "LogIn",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter_appcare/configs/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../configs/api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool hidepassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkToken1();
  }

  checkToken1() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      headers?['Authorization'] = "bearer ${prefs.getString('token')}";
      Navigator.pushNamedAndRemoveUntil(
          context, "/Page1", (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 63, 217, 255),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  const SizedBox(height: 100),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: username,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 17),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                labelText: 'username',
                                hintText: 'ชื่อผู้ใช้',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 1, 135, 197),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  size: 30,
                                  color: Colors.white,
                                )),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              controller: password,
                              obscureText: hidepassword,
                              decoration: InputDecoration(
                                  labelText: 'password',
                                  hintText: 'รหัสผ่าน',
                                  hintStyle: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: (() {
                                        setState(() {
                                          hidepassword = !hidepassword;
                                        });
                                      }),
                                      icon: Icon(
                                        hidepassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 30,
                                        color: Colors.white,
                                      )))),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () async {
                              await checkLogin(
                                  username.text, password.text, context);
                              // Navigator.pushNamedAndRemoveUntil(context,
                              //     "/Page1", (Route<dynamic> route) => false);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 45, 134, 156),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              primary: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'or',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/PageOne");
                            },
                            child: const Text('Register',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 45, 134, 156),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              primary: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ])),
          ),
        ));
  }
}

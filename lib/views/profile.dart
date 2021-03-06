import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appcare/models/profilemenu.dart';
import 'package:flutter_appcare/models/side_menu.dart';
import 'package:flutter_appcare/views/editorprofile/profile_address.dart';
import 'package:flutter_appcare/views/editorprofile/profile_name.dart';
import 'package:flutter_appcare/views/editorprofile/profile_phone.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../configs/api.dart';
import 'login/login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  get data => null;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController dateage = TextEditingController();
  dynamic data;
  dynamic age;
  late TextEditingController title;

  @override
  void initState() {
    super.initState();
    startApi();
    calculatorAge();
  }

  startApi() async {
    //เอาตัวidของcustomerมาใช้กับหน้านี้แล้วเอาค่าไปใส่ในidUser
    dynamic item = await getdataprofile();
    //ส่งค่าไปยัง getdataหรือตัวรับapi
    setState(() {
      data = item;
    });
  }

  calculatorAge() {
    DateTime birtday = DateTime(2000, 01, 06);
    DateDuration duration;
    duration = AgeCalculator.age(birtday);
    setState(() {
      age = duration;
    });
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลส่วนตัว'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: data != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            'https://github.com/nutcras/images/blob/main/images/1.jpeg?raw=true'),
                        // backgroundImage: AssetImage(''),
                        backgroundColor:
                            const Color.fromARGB(255, 45, 134, 156),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ProfileMenu(
                    text:
                        '${data['cust_title']} ${data['cust_fname']}  ${data['cust_lname']}',
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ProfileName(data: data)),
                      );
                    },
                  ),
                  ProfileMenu(
                    text: age.toString(),
                    press: () {},
                  ),
                  ProfileMenu(
                    text: '${data['cust_phone']}',
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ProfilePhone(data: data)),
                      );
                    },
                  ),
                  ProfileMenu(
                    text: '${data['cust_address']}',
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ProfileAddress(data: data)),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: const Color.fromARGB(255, 232, 92, 22),
                      primary: const Color.fromARGB(255, 255, 255, 255),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('token');
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHomePage(),
                            //แก้ตรงนี้--------------------------------------------------------------------------------------
                          ),
                          (route) => false);
                    },
                    child: const Text('ออกจากระบบ'),
                  ),
                ],
              ),
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
      drawer: const SideMenu(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_appcare/configs/api.dart';
import 'package:flutter_appcare/models/button_sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/login/login.dart';
import '../views/profile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
    this.routeName,
  }) : super(key: key);

  final String? routeName;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  dynamic data;

  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    //เอาตัวidของcustomerมาใช้กับหน้านี้แล้วเอาค่าไปใส่ในidUser
    dynamic item = await getdataprofile(); //ส่งค่าไปยัง getdataหรือตัวรับapi
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 134, 156),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: GestureDetector(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const Profile()));
                  }),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        // backgroundImage: AssetImage(''),
                        backgroundColor: Colors.white,
                        radius: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data != null
                                ? Text(
                                    '''${data['cust_username']}
${data['cust_fname']}  ${data['cust_lname']}''',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                : const Text(''),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 7),
                ButtonSidemenu(next: Icons.house, text: "หาพี่เลี้ยง", page: 0),
                SizedBox(height: 7),
                ButtonSidemenu(next: Icons.event, text: "นัดหมาย", page: 1),
                SizedBox(
                  height: 7,
                ),
                ButtonSidemenu(
                    next: Icons.settings_backup_restore,
                    text: "ดูประวัติ",
                    page: 2)

                // routeItem(
                //   context,
                //   const Icon(Icons.house),
                //   //แก้ตรงนี้--------------------------------------------------------------------------------------
                //   'หาพี่เลี้ยง',
                //   '/Page1',
                // ),
                // routeItem(
                //   context,
                //   const Icon(Icons.event_note),
                //   //แก้ตรงนี้--------------------------------------------------------------------------------------
                //   'นัดหมาย',
                //   '/book',
                // ),
                // routeItem(
                //   context,
                //   Icon(Icons.map),
                //   //แก้ตรงนี้--------------------------------------------------------------------------------------
                //   'Map',
                //   '/Map',
                // ),
                // routeItem(
                //   context,
                //   const Icon(Icons.settings_backup_restore),
                //   //แก้ตรงนี้--------------------------------------------------------------------------------------
                //   'ดูประวัติ',
                //   '/Backup',
                // ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  // leading: Icon(FontAwesomeIcons.rightFromBracket),
                  title: const Text(
                    'ออกจากระบบ',
                    style: const TextStyle(color: Colors.red),
                  ), //แก้ตรงนี้--------------------------------------------------------------------------------------
                  onTap: () async {
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile routeItem(BuildContext context, Widget? leading, String name,
      String routeItemName) {
    return ListTile(
      selected: widget.routeName == routeItemName,
      selectedColor: Colors.lightGreen,
      leading: leading,
      title: Text(name),
      onTap: () {
        widget.routeName == routeItemName
            ? Navigator.pop(context, true)
            : Navigator.pushReplacementNamed(context, routeItemName);
      },
    );
  }
}

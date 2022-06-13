import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_appcare/configs/config.dart';
import 'package:flutter_appcare/models/profilemenu.dart';
import 'package:flutter_appcare/models/sidemenu.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../views/booking/waitingbooking.dart';
import '../views/inputmentor.dart';
import '../views/profile.dart';

Future checkLogin(String username, String password, context) async {
  EasyLoading.show(status: 'loading...');

  Uri url = Uri.parse('http://206.189.92.71:3200/api/customer/login');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({"username": username, "password": password}),
  )
      .then((req) async {
    if (req.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      var data = jsonDecode(req.body);
      prefs.setString('token', data['token']);
      prefs.setInt('idm', data['idc']);
      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const InputMentor()),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}

Future checkRegister(username, password, name, surname, context) async {
  EasyLoading.show(status: 'loading...');
  Uri url = Uri.parse('http://206.189.92.71:3200/api/customer');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({
      "username": username,
      "password": password,
      "fname": name,
      "lname": surname
    }),
  )
      .then((req) async {
    if (req.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      var data = jsonDecode(req.body);
      prefs.setString('token', data['token']);
      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const InputMentor()),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}

Future<dynamic> removeBooking(dynamic idbook, context) async {
  Uri url = Uri.parse(
      'http://206.189.92.71:3200/api/booking/$idbook'); //รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง
  return await http
      .put(url,
          headers: headers,
          body: jsonEncode({
            "bstatus": 74,
          }))
      .then((req) async {
    if (req.statusCode == 204) {
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/book', (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}

Future<dynamic> inputmentor() async {
  Uri url = Uri.parse('http://206.189.92.71:3200/api/mentor');
  return await http
      .get(
    url,
    headers: headers,
  )
      .then((req) async {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future<dynamic> getdataprofile() async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? idUser = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.92.71:3200/api/customer/$idUser');
  // Uri url = Uri.parse('http://192.168.1.9:3200/api/customer/$idUser');
  return await http
      .get(
    url,
    headers: headers,
  )
      .then((req) async {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future<dynamic> getdata(dynamic idPage) async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? idUser = prefs.getInt('idm');
  Uri url = Uri.parse(
      'http://206.189.92.71:3200/api/booking/men/$idPage/$idUser'); //รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง
  return await http
      .get(
    url,
  )
      .then((req) async {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future sendtimebook(
    idmentor, pictime, picdate, pictime2, picdate2, context) async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? idUser = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.92.71:3200/api/booking');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({
      "start_time": picdate + ' ' + pictime,
      "end_time": picdate2 + ' ' + pictime2,
      "men_id": idmentor,
      "cust_id": idUser,
      "bstatus": 71,
    }),
  )
      .then((req) async {
    if (req.statusCode == 201) {
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WaitingBooking()),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}

Future sendDataProfile1(title, name, surname, context) async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? idUser = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.92.71:3200/api/customer/p1/$idUser');
  http
      .put(
    url,
    headers: headers,
    body: jsonEncode({
      "title": title,
      "fname": name,
      "lname": surname,
    }),
  )
      .then((req) async {
    if (req.statusCode == 204) {
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Profile()),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}

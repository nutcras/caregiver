import 'package:flutter/material.dart';
import 'package:flutter_appcare/views/login/register.dart';
import 'package:flutter_appcare/views/booking/backup.dart';
import 'package:flutter_appcare/views/booking/booking.dart';
import 'package:flutter_appcare/views/search_mentor.dart';
import 'package:flutter_appcare/lern/Map.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/PageOne': (context) => const PageOne(),
  '/Page1': (context) => const InputMentor(),
  '/Map': (context) => GoogleMaps(),
  '/book': (context) => const Booking(),
  '/Backup': (context) => const BackUp(),
};

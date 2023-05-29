import 'dart:io';

import 'package:flutter/material.dart';

class Contact {
  String fullName;
  String chat;
  String phoneNumber;
  File? image;

  List<String> Dates;
  List<String> Months;
  List<String> Years;
  List<String> Hours;
  List<String> Minits;

  Contact({
    required this.fullName,
    required this.chat,
    required this.phoneNumber,
    this.image,
    required this.Dates,
    required this.Months,
    required this.Years,
    required this.Minits,
    required this.Hours,
  });
}

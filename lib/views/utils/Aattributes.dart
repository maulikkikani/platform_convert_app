import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convert_app/modals/contact_model.dart';

class contactList{
  static List<Contact> allContacts = [];
}


//controllers
File? image;
bool profileswitch = false;
bool themeswitch = false;
TextEditingController namecontroller = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController chatcontroller = TextEditingController();

TextEditingController profilenamecontroller = TextEditingController(text: profliename);
TextEditingController profilebiocontroller = TextEditingController(text: profilebio);

String? profliename;
String? profilebio;
File? image1;

GlobalKey<FormState> formKey = GlobalKey<FormState>();
GlobalKey<FormState> formKey1 = GlobalKey<FormState>();



bool showtextfield = true;

String? Fullname;
String? PhoneNumber;
String? Chat;


TextEditingController namecontroller1 = TextEditingController();
TextEditingController phonecontroller1 = TextEditingController();
TextEditingController chatcontroller1 = TextEditingController();

DateTime Date = DateTime.now();
DateTime? PickedDate;

TimeOfDay? PickedTime;
TimeOfDay Time = TimeOfDay.now();

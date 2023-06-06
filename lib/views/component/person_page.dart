import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convert_app/controller/provider/changetheprovider.dart';
import 'package:platform_convert_app/controller/provider/chnageappprovider.dart';
import 'package:platform_convert_app/modals/contact_model.dart';
import 'package:platform_convert_app/views/utils/Attributes.dart';
import 'package:provider/provider.dart';

class personpage extends StatefulWidget {
  const personpage({Key? key}) : super(key: key);

  @override
  State<personpage> createState() => _personpageState();
}

class _personpageState extends State<personpage> {
  DateTime InitialTime = DateTime.now();
  String? PeriodName;
  String selectedDate = "pick a date";

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1901),
        lastDate: DateTime(2099));

    if (picked != null) {
      setState(() {
        selectedDate = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    if ((Provider.of<ChangeAppThemeProvider>(context)
        .changeAppModel
        .AppthemeMode ==
        false)) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.all(
            w * 0.04,
          ),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.01,
              ),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: h * 0.25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(w * 0.08),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Choose Photo",
                                    style: TextStyle(
                                      fontSize: w * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              ImagePicker picker =
                                              ImagePicker();
                                              XFile? img =
                                              await picker.pickImage(
                                                  source: ImageSource
                                                      .camera);
                                              if (img != null) {
                                                setState(() {
                                                  image = File(img.path);
                                                });
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            icon: Icon(
                                              Icons.camera_alt_outlined,
                                              size: w * 0.20,
                                            ),
                                          ),
                                          Text(
                                            "Camera",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: w * 0.04,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              ImagePicker picker =
                                              ImagePicker();
                                              XFile? img =
                                              await picker.pickImage(
                                                  source: ImageSource
                                                      .gallery);
                                              if (img != null) {
                                                setState(() {
                                                  image = File(img.path);
                                                });
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            icon: Icon(
                                              Icons
                                                  .photo_camera_back_outlined,
                                              size: w * 0.20,
                                            ),
                                          ),
                                          Text(
                                            "Gallery",
                                            style: TextStyle(
                                              fontSize: w * 0.04,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      });
                    },
                    child: CircleAvatar(
                      radius: h * 0.085,
                      foregroundImage: image != null
                          ? FileImage(File(image!.path))
                          : null,
                      child:
                      Icon(Icons.add_a_photo_outlined, size: w * 0.1),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.04,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: "Full Name",
                      ),
                      controller: namecontroller,
                      // keyboardType: ,
                      // textInputAction: ,
                      // onSaved: ,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your full Name";
                        } else {
                          null;
                        }
                      },
                    ),
                    SizedBox(
                      height: h * 0.020,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                        hintText: " Phone Number",
                      ),
                      controller: phonecontroller,
                      keyboardType: TextInputType.number,
                      // textInputAction: ,
                      // onSaved: ,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Phone Number";
                        } else {
                          null;
                        }
                      },
                    ),
                    SizedBox(
                      height: h * 0.020,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.message_outlined),
                        hintText: "Chat Conversation",
                      ),
                      controller: chatcontroller,
                      // keyboardType: ,
                      // textInputAction: ,
                      // onSaved: ,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Phone Number";
                        } else {
                          null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.015,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: Date,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2024),
                        confirmText: "CONTINUE",
                        cancelText: "BACK",
                        initialDatePickerMode: DatePickerMode.day,

                        // initialEntryMode:DatePickerEntryMode.calendarOnly,
                      );
                      setState(() {
                        if (date != null) {
                          PickedDate = date;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.calendar_month_rounded,
                      size: h * 0.03,
                    ),
                  ),
                  (PickedDate != null)
                      ? Text(
                      "${PickedDate?.day} / ${PickedDate?.month} / ${PickedDate?.year}")
                      : const Text("Pick Date"),
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      PickedTime = await showTimePicker(
                        context: context,
                        initialTime: Time,
                      );

                      if (PickedTime != null) {
                        setState(() {
                          Time = PickedTime!;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.watch_later_outlined,
                      size: h * 0.03,
                    ),
                  ),
                  (PickedTime != null)
                      ? (Time.periodOffset == 0)
                      ? Text(
                      "${Time.hour} : ${Time.minute}  ${Time.period.name}")
                      : (Time.hour > 12)
                      ? Text(
                      "${Time.hour - 12} : ${Time.minute}  ${Time.period.name}")
                      : Text(
                      "${Time.hour} : ${Time.minute}  ${Time.period.name}")
                      : const Text("Pick Time"),
                ],
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                    String name = namecontroller.text;
                    String phone = phonecontroller.text;
                    String chat = chatcontroller.text;
                    String? Date = PickedDate!.day.toString();
                    String? Month = PickedDate!.month.toString();
                    String? years = PickedDate!.year.toString();
                    String? minutes = PickedTime!.minute.toString();
                    String? Hours = PickedTime!.hour.toString();

                    Contact c1 = Contact(
                      fullName: name,
                      chat: chat,
                      phoneNumber: phone,
                      image: image,
                      Dates:Date.toString().split("/"),
                      Months: Month.toString().split("/"),
                      Years: years.toString().split("/"),
                      Minits: minutes.toString().split(":"),
                      Hours: Hours.toString().split(":"),
                    );

                    contactList.allContacts.add(c1);
                    namecontroller.clear();
                    phonecontroller.clear();
                    chatcontroller.clear();

                    image = null;
                  });
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Visibility(
        child: CupertinoPageScaffold(
          child: SafeArea(
            child: Container(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Text("CHOOSE PHOTOS"),
                                actions: [
                                  GestureDetector(
                                    onTap: () async {
                                      ImagePicker picker = ImagePicker();
                                      XFile? img = await picker.pickImage(
                                          source: ImageSource.camera);
                                      if (img != null) {
                                        setState(() {
                                          image = File(img.path);
                                        });
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Icon(
                                      CupertinoIcons.camera,
                                      size: 75,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      ImagePicker picker = ImagePicker();
                                      XFile? img = await picker.pickImage(
                                          source: ImageSource.gallery);
                                      if (img != null) {
                                        setState(() {
                                          image = File(img.path);
                                        });
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Icon(
                                      CupertinoIcons.photo,
                                      size: 75,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: (Provider.of<ChangeThemeProvider>(context).changethemeModel.isDark)
                              ?Colors.deepPurple
                              :Colors.blue,
                          radius: h * 0.085,
                          foregroundImage: image != null
                              ? FileImage(File(image!.path))
                              : null,
                          child:
                          Icon(Icons.add_a_photo_outlined, size: w * 0.1),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.030,
                      ),
                      CupertinoTextFormFieldRow(
                        prefix: const Icon(CupertinoIcons.person),
                        placeholder: "Full Name",
                        controller: namecontroller,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Full Name";
                          } else {
                            return null;
                          }
                        },
                        // controller: ,
                      ),
                      SizedBox(
                        height: h * 0.010,
                      ),
                      CupertinoTextFormFieldRow(
                        prefix: const Icon(CupertinoIcons.phone),
                        placeholder: "Phone Number",
                        controller: phonecontroller,
                        keyboardType: TextInputType.number,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Phone Number";
                          } else {
                            return null;
                          }
                        },
                        // controller: ,
                      ),
                      SizedBox(
                        height: h * 0.010,
                      ),
                      CupertinoTextFormFieldRow(
                        prefix: const Icon(CupertinoIcons.chat_bubble_text),
                        placeholder: "Chat Conversation",
                        controller: chatcontroller,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Conversation";
                          } else {
                            return null;
                          }
                        },
                        // controller: ,
                      ),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => Container(
                                    height: h * 0.35,
                                    width: w * 1,
                                    child: CupertinoDatePicker(
                                      initialDateTime: Date,
                                      minimumYear: 2000,
                                      maximumYear: 2024,
                                      use24hFormat: false,
                                      mode: CupertinoDatePickerMode.date,
                                      backgroundColor: CupertinoColors.separator,                                        onDateTimeChanged: (val) {
                                      setState(() {
                                        PickedDate = val;
                                      });
                                    },
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.calendar_today,
                              ),
                            ),

                            (PickedDate != null)
                                ? Text(
                              "${PickedDate?.day} / ${PickedDate?.month} / ${PickedDate?.year}",
                              style: const TextStyle(
                                  color: CupertinoColors.inactiveGray
                              ),
                            )
                                : Text(
                              "  Pick Date",
                              style: TextStyle(
                                color:  CupertinoColors.inactiveGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => Container(
                                    width: w * 1,
                                    height: h * 0.35,
                                    child: CupertinoDatePicker(
                                      onDateTimeChanged: (val) {
                                        setState(() {
                                          InitialTime = val;
                                          if (InitialTime.hour >= 12) {
                                            PeriodName = "PM";
                                          } else {
                                            PeriodName = "AM";
                                          }
                                        });
                                      },
                                      initialDateTime: InitialTime,
                                      mode: CupertinoDatePickerMode.time,
                                      backgroundColor: CupertinoColors.separator,
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.time,
                              ),
                            ),
                            SizedBox(
                              width: w * 0.02,
                            ),
                            (PeriodName == null)
                                ? Text(
                              "Pick Time",
                              style: TextStyle(
                                color:  CupertinoColors.inactiveGray,),
                            )
                                : (PeriodName == "AM")
                                ? Text(
                              "${InitialTime.hour} : ${InitialTime.minute} $PeriodName",
                              style: const TextStyle(
                                  color: CupertinoColors.inactiveGray
                              ),
                            )
                                : (InitialTime.hour > 12)
                                ? Text(
                              "${InitialTime.hour - 12} : ${InitialTime.minute} $PeriodName",
                              style: const TextStyle(
                                  color: CupertinoColors.inactiveGray
                              ),
                            )
                                : Text(
                              "${InitialTime.hour} : ${InitialTime.minute} $PeriodName",
                              style: const TextStyle(
                                  color:CupertinoColors.inactiveGray
                              ),
                            ),
                          ],
                        ),
                      ),
                      CupertinoButton.filled(
                        padding: const EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                          right: 30,
                          left: 30,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        child: const Text("SAVE"),
                        onPressed: () {
                          setState(() {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                            }
                            String name = namecontroller.text;
                            String phone = phonecontroller.text;
                            String chat = chatcontroller.text;
                            String Date = PickedDate!.day.toString();
                            String Month = PickedDate!.month.toString();
                            String years = PickedDate!.year.toString();
                            String minutes = PickedTime!.minute.toString();
                            String Hours = PickedTime!.hour.toString();

                            Contact a1 = Contact(
                              fullName: name,
                              chat: chat,
                              phoneNumber: phone,
                              image: image,
                              Dates:Date.toString().split("/"),
                              Months: Month.toString().split("/"),
                              Years: years.toString().split("/"),
                              Minits: minutes.toString().split(":"),
                              Hours: Hours.toString().split(":"),
                            );

                            contactList.allContacts.add(a1);
                            namecontroller.clear();
                            phonecontroller.clear();
                            chatcontroller.clear();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
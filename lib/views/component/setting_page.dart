import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convert_app/controller/provider/changetheprovider.dart';
import 'package:platform_convert_app/controller/provider/chnageappprovider.dart';
import 'package:platform_convert_app/views/utils/Attributes.dart';
import 'package:provider/provider.dart';

class settingpage extends StatefulWidget {
  const settingpage({Key? key}) : super(key: key);

  @override
  State<settingpage> createState() => _settingpageState();
}

class _settingpageState extends State<settingpage> {

  Color deepPurpple = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return (Provider.of<ChangeAppThemeProvider>(context)
        .changeAppModel
        .AppthemeMode ==
        false)
        ? Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person, size: 30),
              title: const Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Update Profile Data"),
              trailing: Switch(
                onChanged: (value) {
                  setState(() {
                    profileswitch = value;
                  });
                },
                value: profileswitch,
              ),
            ),
            SizedBox(
              height: h * 0.025,
            ),
            (profileswitch == true)
                ? Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                const Text("Choose Photo"),
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
                                            XFile? img = await picker
                                                .pickImage(
                                                source:
                                                ImageSource
                                                    .camera);
                                            if (img != null) {
                                              setState(() {
                                                image1 =
                                                    File(img.path);
                                              });
                                              Navigator.of(context)
                                                  .pop();
                                            }
                                          },
                                          icon: const Icon(
                                              Icons
                                                  .camera_alt_outlined,
                                              size: 80),
                                        ),
                                        const Text("Camera")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            ImagePicker picker =
                                            ImagePicker();
                                            XFile? img = await picker
                                                .pickImage(
                                                source:
                                                ImageSource
                                                    .gallery);
                                            if (img != null) {
                                              setState(() {
                                                image1 =
                                                    File(img.path);
                                              });
                                              Navigator.of(context)
                                                  .pop();
                                            }
                                          },
                                          icon: const Icon(
                                              Icons
                                                  .photo_camera_back_outlined,
                                              size: 80),
                                        ),
                                        const Text("Gallery")
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
                    foregroundImage: image1 != null
                        ? FileImage(File(image1!.path))
                        : null,
                    child: Icon(Icons.add_a_photo_outlined,
                        size: w * 0.1),
                  ),
                ),
                SizedBox(
                  height: h * 0.025,
                ),
                Form(
                  key: formKey1,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabled: true,
                          enabledBorder: InputBorder.none,
                          hintText: "    Enter your name...",
                        ),
                        controller: profilenamecontroller,
                        // keyboardType: ,
                        // textInputAction: ,
                        // onSaved: ,
                        onSaved: (newValue) {
                          profliename = newValue;
                        },
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
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Enter your Bio...",
                        ),
                        controller: profilebiocontroller,
                        // keyboardType: ,
                        // textInputAction: ,
                        // onSaved: ,
                        onSaved: (newValue) {
                          profilebio = newValue;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your Bio";
                          } else {
                            null;
                          }
                        },
                      ),
                      SizedBox(
                        height: h * 0.025,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: h * 0.12,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (formKey1.currentState!
                                    .validate()) {
                                  formKey1.currentState!.save();
                                }
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              alignment: Alignment.center,
                              child: Text(
                                "SAVE",
                                style:
                                TextStyle(color: deepPurpple),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              profilenamecontroller.clear();
                              profilebiocontroller.clear();

                              setState(() {
                                image1 = null;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              alignment: Alignment.center,
                              child: Text(
                                "CLEAR",
                                style:
                                TextStyle(color: deepPurpple),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.025,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
                : Container(),
            const Divider(),
            SizedBox(
              height: h * 0.010,
            ),
            ListTile(
              leading: const Icon(Icons.light_mode_outlined, size: 30),
              title: const Text(
                "Theme",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Change Theme"),
              trailing: Switch(
                onChanged: (value) {
                  Provider.of<ChangeThemeProvider>(context, listen: false)
                      .chnageTheme();
                },
                value: Provider.of<ChangeThemeProvider>(context,
                    listen: true)
                    .changethemeModel
                    .isDark,
              ),
            ),
          ],
        ),
      ),
    )
        : CupertinoPageScaffold(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              CupertinoListTile(
                  title: Text('Profile',
                      style: TextStyle(
                          color:
                          (Provider.of<ChangeThemeProvider>(context)
                              .changethemeModel
                              .isDark)
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                          fontWeight: FontWeight.bold)),
                  subtitle: const Text("Update Profile Data"),
                  leading: const Icon(CupertinoIcons.person, size: 30),
                  trailing: CupertinoSwitch(
                    value: profileswitch,
                    onChanged: (value) {
                      setState(() {
                        profileswitch = value;
                      });
                    },
                  )),
              (profileswitch == true)
                  ? Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: h * 0.03,
                        ),
                        GestureDetector(
                          onTap: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title:
                                  const Text("CHOOSE PHOTOS"),
                                  actions: [
                                    GestureDetector(
                                      onTap: () async {
                                        ImagePicker picker =
                                        ImagePicker();
                                        XFile? img =
                                        await picker.pickImage(
                                            source: ImageSource
                                                .camera);
                                        if (img != null) {
                                          setState(() {
                                            image1 = File(img.path);
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
                                        ImagePicker picker =
                                        ImagePicker();
                                        XFile? img =
                                        await picker.pickImage(
                                            source: ImageSource
                                                .gallery);
                                        if (img != null) {
                                          setState(() {
                                            image1 = File(img.path);
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
                            foregroundImage: image1 != null
                                ? FileImage(File(image1!.path))
                                : null,
                            child: Icon(Icons.add_a_photo_outlined,
                                size: w * 0.1),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.010,
                        ),
                        CupertinoTextFormFieldRow(
                          placeholder: "Enter your name",
                          style: TextStyle(
                            color:
                            (Provider.of<ChangeThemeProvider>(
                                context)
                                .changethemeModel
                                .isDark)
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          ),
                          textAlign: TextAlign.center,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(8),
                          //   border: Border.all(
                          //     color: Colors.grey,
                          //     width: 1,
                          //   ),
                          // ),
                          onSaved: (newValue) {
                            profliename = newValue;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your  Name";
                            } else {
                              return null;
                            }
                          },
                          controller: profilenamecontroller,
                        ),
                        CupertinoTextFormFieldRow(
                          textAlign: TextAlign.center,
                          placeholder: "Enter your bio",
                          style: TextStyle(
                            color:
                            (Provider.of<ChangeThemeProvider>(
                                context)
                                .changethemeModel
                                .isDark)
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          ),
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(8),
                          //   border: Border.all(
                          //     color: Colors.grey,
                          //     width: 1,
                          //   ),
                          // ),
                          onSaved: (newValue) {
                            profilebio = newValue;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your bio";
                            } else {
                              return null;
                            }
                          },
                          controller: profilebiocontroller,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                              child: const Text("SAVE"),
                              onPressed: () {
                                setState(() {
                                  if (formKey1.currentState!
                                      .validate()) {
                                    formKey1.currentState!.save();
                                  }
                                });
                              },
                            ),
                            CupertinoButton(
                              child: const Text("CLEAR"),
                              onPressed: () {
                                profilenamecontroller.clear();
                                profilebiocontroller.clear();
                                setState(() {
                                  image1 = null;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
                  : Container(),
              SizedBox(
                height: h * 0.02,
              ),
              CupertinoListTile(
                  title:  Text(
                    'Theme',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (Provider.of<ChangeThemeProvider>(context).changethemeModel.isDark)
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                  subtitle: const Text("Change Theme"),
                  leading: const Icon(CupertinoIcons.sun_max, size: 30),
                  trailing: CupertinoSwitch(
                    value: Provider.of<ChangeThemeProvider>(context)
                        .changethemeModel
                        .isDark,
                    onChanged: (value) {
                      Provider.of<ChangeThemeProvider>(context,
                          listen: false)
                          .chnageTheme();
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
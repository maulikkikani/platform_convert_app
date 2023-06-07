import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convert_app/controller/provider/chnage_app_provider.dart';
import 'package:platform_convert_app/views/component/call_page.dart';
import 'package:platform_convert_app/views/component/chat_page.dart';
import 'package:platform_convert_app/views/component/person_page.dart';
import 'package:platform_convert_app/views/component/setting_page.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/change_theme_provider.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  DateTime initialDate = DateTime.now();
  DateTime? pickedDate;

  Color deepPurpple = Colors.deepPurple;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    if ((Provider.of<ChangeAppThemeProvider>(context)
        .changeAppModel
        .AppthemeMode ==
        false)) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              bottom: TabBar(

                indicatorColor: deepPurpple,
                unselectedLabelColor:Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
                labelColor: deepPurpple,
                tabs: const[
                  Tab(
                    icon: Icon(
                      Icons.person_add_alt,
                      size: 25,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "CHATS",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "CALLS",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "SETTINGS",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              title: const Text("Platform Converter"),
              actions: [
                Switch(
                  value: Provider.of<ChangeAppThemeProvider>(context)
                      .changeAppModel
                      .AppthemeMode,
                  onChanged: (value) {
                    Provider.of<ChangeAppThemeProvider>(context,
                        listen: false)
                        .changeApp();
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: const TabBarView(
              children: [
                personpage(),
                chat_page(),
                call_page(),
                settingpage(),
              ],
            ),
          ),
        ),
      );
    } else {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_badge_plus,),
              label: 'PERSON',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              label: 'CHATS',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone),
              label: 'PHONE',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'SETTINGS',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  backgroundColor: (Provider.of<ChangeThemeProvider>(context).changethemeModel.isDark)
                      ? CupertinoColors.black
                      : CupertinoColors.white,
                  middle:  Text("Platform Converter",
                      style: TextStyle(
                        color: (Provider.of<ChangeThemeProvider>(context).changethemeModel.isDark)
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      )),
                  trailing: CupertinoSwitch(
                    value: Provider.of<ChangeAppThemeProvider>(context)
                        .changeAppModel
                        .AppthemeMode,
                    onChanged: (value) {
                      setState(() {
                        Provider.of<ChangeAppThemeProvider>(context,
                            listen: false)
                            .changeApp();
                      });
                    },
                  ),
                ),
                child: SafeArea(
                  child: IndexedStack(
                    index: index,
                    children: const [
                      personpage(),
                      chat_page(),
                      call_page(),
                      settingpage(),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    }
  }
}
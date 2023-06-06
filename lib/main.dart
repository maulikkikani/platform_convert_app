import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convert_app/controller/provider/chnageappprovider.dart';
import 'package:platform_convert_app/views/screens/home_page.dart';
import 'package:platform_convert_app/views/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/provider/changetheprovider.dart';
import 'modals/change_app_mode.dart';
import 'modals/change_theme_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isdarktheme = prefs.getBool('isdark') ?? false;
  bool apptheme = prefs.getBool('appthemechange') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // create: (context) =>  ChangeAppThemeProvider(),
          create: (context) => ChangeAppThemeProvider(
            changeAppModel: Change_app_model(AppthemeMode: apptheme),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeThemeProvider(
            changethemeModel: ChangeThemeModel(isDark: isdarktheme),
          ),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => SelectedDateProvider(),
        // )
      ],
      builder: (context, child) {
        return (Provider.of<ChangeAppThemeProvider>(context)
            .changeAppModel
            .AppthemeMode ==
            false)
            ? MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lighttheme,
          darkTheme: AppTheme.Darktheme,
          themeMode: (Provider.of<ChangeThemeProvider>(context)
              .changethemeModel
              .isDark ==
              false)
              ? ThemeMode.light
              : ThemeMode.dark,
          routes: {
            '/': (context) => const homepage(),
          },
        )
            : CupertinoApp(
          theme: MaterialBasedCupertinoThemeData(
              materialTheme: (Provider.of<ChangeThemeProvider>(context,
                  listen: false)
                  .changethemeModel
                  .isDark)
                  ? AppTheme.Darktheme
                  : AppTheme.lighttheme),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => const homepage(),
          },
        );
      },
    ),
  );
}

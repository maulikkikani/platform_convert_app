import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:platform_convert_app/modals/change_app_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class ChangeAppThemeProvider extends ChangeNotifier{
//   ChangeAppModel changeAppModel = ChangeAppModel(AppthemeMode: false);
//
//   changeApp()async{
//     changeAppModel.AppthemeMode = ! changeAppModel.AppthemeMode;
//    notifyListeners();
//   }
// }

//
class ChangeAppThemeProvider extends ChangeNotifier{
  Change_app_model changeAppModel;

  ChangeAppThemeProvider({required this.changeAppModel});


  changeApp()async{
    changeAppModel.AppthemeMode = !changeAppModel.AppthemeMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('appthemechange', changeAppModel.AppthemeMode);
    notifyListeners();
  }
}




// class SelectedDateProvider extends ChangeNotifier{
//     late SelectDate _selectDate;
//
//   SelectDate get selectDate => _selectDate;
//
//   Future<void> setSelectedDate(int day,int month,int year)async{
//     _selectDate = SelectDate(day: day, month: month, year: year);
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('selectedDay', day);
//     await prefs.setInt('selectedMonth', month);
//     await prefs.setInt('selectedYear', year);
//     notifyListeners();
//   }
//
//    Future<void> loadselectedDate()async{
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      int? day =  prefs.getInt('selectedDay');
//      int? month =  prefs.getInt('selectedMonth');
//      int? year =  prefs.getInt('selectedYear');
//
//      if(day != null && month != null && year != null){
//        _selectDate = SelectDate(day: day, month: month, year: year);
//      }
//      notifyListeners();
//    }
// }
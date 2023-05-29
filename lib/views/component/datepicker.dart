// import 'package:flutter/material.dart';
// import 'package:platform_convert_app/controller/provider/chnageappprovider.dart';
// import 'package:provider/provider.dart';
//
// class DatePickerWidget extends StatefulWidget {
//   const DatePickerWidget({Key? key}) : super(key: key);
//
//   @override
//   State<DatePickerWidget> createState() => _DatePickerWidgetState();
// }
//
// class _DatePickerWidgetState extends State<DatePickerWidget> {
//    DateTime _selectedDate;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     final selectedDateProvider =
//         Provider.of<SelectedDateProvider>(context, listen: false);
//
//     if (selectedDateProvider.selectDate != null) {
//       _selectedDate = DateTime(
//         selectedDateProvider.selectDate.year,
//         selectedDateProvider.selectDate.month,
//         selectedDateProvider.selectDate.day,
//       );
//     } else {
//       _selectedDate = DateTime.now();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final selectedDateProvider =
//         Provider.of<SelectedDateProvider>(context, listen: false);
//     return Column(
//       children: [
//         Text('Selected Date:${_selectedDate.toString()}'),
//         ElevatedButton(
//           onPressed: () async {
//             DateTime? picked = await showDatePicker(
//               context: context,
//               initialDate: _selectedDate,
//               firstDate: DateTime(DateTime.now().year - 10),
//               lastDate: DateTime(DateTime.now().year + 10),
//             );
//             if(picked != null){
//               setState(() {
//                 _selectedDate = picked;
//               });
//               await selectedDateProvider.setSelectedDate(picked.day, picked.month, picked.year);
//             }
//           },
//           child: Text('select date'),
//         ),
//       ],
//     );
//   }
// }

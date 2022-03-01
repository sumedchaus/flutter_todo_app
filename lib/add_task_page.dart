import 'package:flutter/material.dart';
import 'package:flutter_todo_app/thems.dart';
import 'package:flutter_todo_app/widgets/my_input_filed.dart';
import 'package:flutter_todo_app/widgets/reusable_dropdown.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'model/dropdown_model.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _endTime = "09.30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = "None";
  List<String> repeatList = [
    "None",
    "Daily",
    "Weekly",
    "Monthly"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Task",
                  style: headingStyle,
                ),
                MyInputField(title: "Title", hint: "Enter title here."),
                MyInputField(title: "Note", hint: "Enter note here."),
                GestureDetector(
                  onTap: () {
                    _getDateFromUser();
                  },
                  child: MyInputField(
                      title: "Date",
                      hint: DateFormat.yMd().format(_selectedDate),
                      suffixIcon: Icon(Icons.calendar_today_outlined),
                      enable: false),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        child: MyInputField(
                            title: "Start Time",
                            hint: _startTime,
                            suffixIcon: Icon(Icons.access_time),
                            enable: false),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        child: MyInputField(
                            title: "End Time",
                            hint: _endTime,
                            suffixIcon: Icon(Icons.access_time),
                            enable: false),
                      ),
                    ),
                  ],
                ),
                ReusableDropdown(
                  title: "Reminder",
                  value: _selectedRemind.toString(),
                  onChanged: (String val) {
                    setState(() {
                      _selectedRemind = int.parse(val);
                    });
                  },
                  items: remindList,
                ),
                ReusableDropdown(
                    title: "Repeat",
                    value: _selectedRepeat,
                    items: repeatList,
                    onChanged: (String val){
                      setState(() {
                        _selectedRepeat = val;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      // backgroundColor: context.theme.backgroundColor,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile_image.jpg"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2030));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickTime = await _showTimePicker();
    String _formatedTime = pickTime.format(context);
    if (pickTime == null) {
      print("Time Cancled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }
}






//       Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Remind",
//                       style: titleStyle,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(color: Colors.grey.withOpacity(0.3)),
//                       ),
//                       child: DropdownButton(
//                           isExpanded: true,
//                           underline: SizedBox.shrink(),
//                           value: _selectedRemind.toString(),
//                           items: remindList
//                               .map<DropdownMenuItem<String>>((int value) {
//                             return DropdownMenuItem<String>(
//                               value: value.toString(),
//                               child: Text(value.toString()),
//                             );
//                           }).toList(),
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               _selectedRemind = int.parse(newValue!);
//                             });
//                           }),
//                     ),
//                   ],
//                 )

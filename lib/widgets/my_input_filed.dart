import 'package:flutter/material.dart';
import 'package:flutter_todo_app/thems.dart';
import 'package:get/get.dart';

class MyInputField extends StatelessWidget {
  MyInputField(
      {this.enable, this.suffixIcon, required this.title, required this.hint, this.widget, this.controller});

  String title;
  String hint;
  TextEditingController? controller;
  Widget? widget;
  Icon? suffixIcon;
  bool? enable;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            enabled:enable ,
            readOnly: widget== null? false: true,
            style: subTitleStyle,
            // obscureText: obscureText,
            maxLines: 1,
            cursorColor: Get.isDarkMode? primaryClr: primaryClr,
            // keyboardType: inputType,
            // inputFormatters: inputFormatter,
            controller: controller,
            decoration: InputDecoration(
              // icon: Icon(Icons.person),
                suffixIcon: suffixIcon,

                hintText: hint,
                hintStyle: subTitleStyle,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: bluishClr),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                ),
                fillColor: const Color(0xFFF8F5F1)),
          ),
        ],
      ),
    );
  }
}

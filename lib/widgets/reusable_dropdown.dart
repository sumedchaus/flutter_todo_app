import 'package:flutter/material.dart';

import '../thems.dart';


class ReusableDropdown extends StatelessWidget {
  ReusableDropdown(
      {required this.title,
        required this.value,
        required this.items,
        required this.onChanged});

  String title;
  String value;
  List items;
  void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
          ),
          child: DropdownButton(
            style: subTitleStyle,
            isExpanded: true,
            underline: SizedBox.shrink(),
            value: value,
            items: items.map((t) {
              return DropdownMenuItem<String>(
                value: t.toString(),
                child: Text(t.toString()),
              );
            }).toList(),
            onChanged: (String? val) {
              onChanged(val!);
            },
          ),
        ),
      ],
    );
  }
}


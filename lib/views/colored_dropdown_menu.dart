import 'package:flutter/material.dart';

class ColoredDropdownMenu extends StatefulWidget {
  final List<String> list;
  final String initDropdownValue;
  final Function(String?) onChanged;
  const ColoredDropdownMenu(
      {required this.list,
      super.key,
      required this.initDropdownValue,
      required this.onChanged});

  @override
  State<ColoredDropdownMenu> createState() => _ColoredDropdownMenuState();
}

class _ColoredDropdownMenuState extends State<ColoredDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget.initDropdownValue,
      onChanged: widget.onChanged,
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}

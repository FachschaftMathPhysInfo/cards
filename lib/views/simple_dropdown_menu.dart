import 'package:flutter/material.dart';

class SimpleDropdownMenu extends StatefulWidget {
  final List<Map<String, dynamic>> list;
  final String initDropdownValue;
  final Function(dynamic) onChanged;
  const SimpleDropdownMenu(
      {required this.list,
      super.key,
      required this.initDropdownValue,
      required this.onChanged});

  @override
  State<SimpleDropdownMenu> createState() => _SimpleDropdownMenuState();
}

class _SimpleDropdownMenuState extends State<SimpleDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget.initDropdownValue,
      onChanged: widget.onChanged,
      items: widget.list.map<DropdownMenuItem<String>>((item) {
        return DropdownMenuItem<String>(
          value: item.keys.first,
          child: item.values.first,
        );
      }).toList(),
    );
  }
}

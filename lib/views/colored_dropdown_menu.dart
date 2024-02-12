import 'package:flutter/material.dart';

class ColoredDropdownMenu extends StatefulWidget {
  final List<String> list;
  final int initDropdownValue;
  const ColoredDropdownMenu(
      {required this.list, super.key, this.initDropdownValue = 0});

  @override
  State<ColoredDropdownMenu> createState() => _ColoredDropdownMenuState();
}

class _ColoredDropdownMenuState extends State<ColoredDropdownMenu> {
  late String _dropdownValue;

  @override
  void initState() {
    super.initState();
    _dropdownValue = widget.list[widget.initDropdownValue];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _dropdownValue,
      onChanged: (String? value) {
        setState(() {
          _dropdownValue = value!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}

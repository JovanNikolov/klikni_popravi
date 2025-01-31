import 'package:flutter/material.dart';

class DropdownFilter extends StatefulWidget {
  final Function(String?) onSelected;
  const DropdownFilter({super.key, required this.onSelected});

  @override
  _DropdownFilterState createState() => _DropdownFilterState();
}

class _DropdownFilterState extends State<DropdownFilter> {
  final List<String> _items = ['All', 'Electric', 'Technician', 'Handyman', 'Plumber'];
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
          ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: DropdownButton<String>(
        value: _selectedItem,
        hint: const Center(
          child: Text('Repair type'),
        ),
        items: _items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Center(
              child: Text(item),
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
          });
          widget.onSelected(value);
        },
        dropdownColor: Colors.white,
        isExpanded: true,
      ),
    );
  }
}
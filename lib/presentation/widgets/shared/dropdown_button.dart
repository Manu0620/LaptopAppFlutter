import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatelessWidget {
  const DropdownButtonWidget({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.labelText,
    required this.hintText,
    this.leftPadding = 25,
    this.rightPadding = 25,
  }) : super(key: key);

  final List<String> items;
  final void Function(String?) onChanged;
  final String? value;
  final String labelText;
  final String hintText;
  final double leftPadding;
  final double rightPadding;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItems = items.map((item) {
      return DropdownMenuItem(
        value: item,
        child: Text(item),
      );
    }).toList();

    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: rightPadding,
        left: leftPadding,
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        items: dropdownItems,
        onChanged: onChanged,
        
        dropdownColor: const Color.fromRGBO(18, 18, 18, 1),

        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary,
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary,
              width: 2.5,
            ),
          ),
        ),
        
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

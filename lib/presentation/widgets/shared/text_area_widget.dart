import 'package:flutter/material.dart';

class TextAreaWidget extends StatelessWidget {
  const TextAreaWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.leftPadding = 25,
    this.rightPadding = 25,
    this.enabled = true,
    this.maxLines = 3,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final double leftPadding;
  final double rightPadding;
  final bool enabled;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10, bottom: 10, right: rightPadding, left: leftPadding
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        enabled: enabled,
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

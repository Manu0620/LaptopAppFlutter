import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    this.keyboardType = TextInputType.text,
    this.leftPadding = 25,
    this.rightPadding = 25,
    this.enabled = true,
    this.onTap, 
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final double leftPadding;
  final double rightPadding;
  final bool enabled;
  final Function()? onTap;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: rightPadding, left: leftPadding),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        enabled: enabled,
        keyboardType: keyboardType,
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

        onTap: onTap,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

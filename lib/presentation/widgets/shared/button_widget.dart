import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.buttonText,
    this.buttonIcon,
    required this.buttonHeight,
    required this.buttonWM,
    required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final IconData? buttonIcon;
  final double buttonHeight;
  final double buttonWM;
  final Function()? onPressed;

  bool get hasIcon => buttonIcon != null;
  
  @override
  Widget build(BuildContext context) {

    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width * buttonWM, buttonHeight)
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.15)
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: Theme.of(context).colorScheme.inversePrimary, width: 2
              ), 
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            hasIcon ? Icon(
              buttonIcon,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 18,
            ): const Text(''),
            Text(
              buttonText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 18,
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        ),
      ),
    );
    
  }
}

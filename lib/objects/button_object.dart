import 'package:etarot/styling/style.dart';
import 'package:flutter/material.dart';

class CustomButtonStyle extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool disabled;

  const CustomButtonStyle({
    required this.label,
    required this.onPressed,
    this.disabled = false, // Optional parameter with a default value
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : onPressed, // Disable onTap if the button is disabled
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          gradient: LinearGradient(
            colors: disabled
                ? [Colors.grey, Colors.grey] // Use gray colors when disabled
                : [Style.itemColor, Style.itemColorDeg],
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 15.0),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: disabled ? Colors.white54 : Colors.white, // Use a lighter color when disabled
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButtonStyle extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButtonStyle({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          gradient: const LinearGradient(
            colors: [Color(0xFFE052A0), Color(0xFFF15C41)],
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 15.0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
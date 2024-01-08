import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleLoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.fromLTRB(16, 12, 42, 12),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shadowColor: MaterialStateProperty.all<Color>(Colors.black),
        elevation: MaterialStateProperty.all<double>(1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/google_logo.svg',
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 10),
          const Text(
            'Login with Google',
            style: TextStyle(
              color: Color(0xFF757575),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}

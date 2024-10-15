import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnBlock extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color txtColor;
  final Function() onTap;
  const BtnBlock({super.key, required this.title, required this.backgroundColor, required this.txtColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12)
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: txtColor
            ),
          ),
        ),
      ),
    );
  }
}
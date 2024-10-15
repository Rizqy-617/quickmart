import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnBlockV2 extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color txtColor;
  final Function() onTap;
  final bool useBorder;
  final bool useBgColor;
  final Widget icon;
  final Color borderColor;
  const BtnBlockV2({super.key, required this.title, required this.backgroundColor, required this.txtColor, required this.onTap, required this.useBorder, required this.icon, required this.useBgColor, required this.borderColor});

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
            color: useBgColor ? backgroundColor : Colors.transparent,
            border: useBorder ? Border.all(
              color: borderColor,
            ) : null,
            borderRadius: BorderRadius.circular(12)
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: txtColor
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              icon
            ],
          ),
        ),
      ),
    );
  }
}
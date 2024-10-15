import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickmart/template/theme_colors.dart';

class ListItemProfile extends StatelessWidget {
  final String? title;
  final Widget icon;
  final Function()? onTap;
  final Widget? action;
  const ListItemProfile({super.key, this.title, required this.icon, this.onTap, this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 5
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ThemeColors.lightGrey2,
              width: 0.2
            ),
          ),
        ),
        child: ListTile(
          visualDensity: const VisualDensity(horizontal: -4.0),
          title: Text(
            title ?? "",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              color: ThemeColors.lightGrey2
            ),
          ),
          leading: icon,
          trailing: action,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quickmart/store/action/action.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/store/reducers/theme_reducer.dart';
import 'package:quickmart/template/theme_colors.dart';
import 'package:quickmart/widget/list_item_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primaryColorLight,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 40,
                          height: 40,
                          color: ThemeColors.blue,
                          child: Image.network(
                            store!.state.user.image,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${store!.state.user.firstName} ${store!.state.user.lastName}",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              color: ThemeColors.primaryWhite
                            ),
                          ),
                          Text(
                            store!.state.user.email,
                            softWrap: true,
                            maxLines: 2,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              color: ThemeColors.primaryWhite
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Icon(
                    FontAwesome.arrow_right_from_bracket_solid,
                    size: 32,
                    color: ThemeColors.primaryWhite,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)
                  ),
                  color: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Text(
                          "Personal Information",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme),
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      ListItemProfile(
                        icon: Image.asset(
                          "assets/icon/active_icon/box_grey.png",
                          width: 25,
                          height: 25,
                        ),
                        onTap: () {},
                        title: "Shipping Address",
                        action: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: ThemeColors.lightGrey2,
                        ),
                      ),
                      ListItemProfile(
                        icon: Image.asset(
                          "assets/icon/active_icon/card-tick_grey.png",
                          width: 25,
                          height: 25,
                        ),
                        onTap: () {},
                        title: "Payment Method",
                        action: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: ThemeColors.lightGrey2,
                        ),
                      ),
                      ListItemProfile(
                        icon: Image.asset(
                          "assets/icon/active_icon/receipt-edit.png",
                          width: 25,
                          height: 25,
                        ),
                        onTap: () {},
                        title: "Order History",
                        action: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: ThemeColors.lightGrey2,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Text(
                          "Support & Information",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme),
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      ListItemProfile(
                        icon: Image.asset(
                          "assets/icon/active_icon/shield-tick.png",
                          width: 25,
                          height: 25,
                        ),
                        onTap: () {},
                        title: "Privacy Policy",
                        action: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: ThemeColors.lightGrey2,
                        ),
                      ),
                      ListItemProfile(
                        icon: Image.asset(
                          "assets/icon/active_icon/document-text.png",
                          width: 25,
                          height: 25,
                        ),
                        onTap: () {},
                        title: "Term & Conditions",
                        action: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: ThemeColors.lightGrey2,
                        ),
                      ),
                      ListItemProfile(
                        icon: Image.asset(
                          "assets/icon/active_icon/message-question.png",
                          width: 25,
                          height: 25,
                        ),
                        onTap: () {},
                        title: "Frequently Ask Questions",
                        action: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: ThemeColors.lightGrey2,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Text(
                          "Account Management",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme),
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      ListItemProfile(
                        icon: Image.asset(
                          "assets/icon/active_icon/lock.png",
                          width: 25,
                          height: 25,
                        ),
                        onTap: () {},
                        title: "Change Password",
                        action: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: ThemeColors.lightGrey2,
                        ),
                      ),
                      ListItemProfile(
                        icon: Image.asset(
                          "assets/icon/active_icon/mobile.png",
                          width: 25,
                          height: 25,
                        ),
                        onTap: () {},
                        title: "Dark Theme",
                        action: Switch(
                          value: store!.state.scheme == ThemeScheme.light ? false : true,
                          activeColor: ThemeColors.primaryColorLight,
                          inactiveTrackColor: ThemeColors.lightGrey1,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          thumbColor: WidgetStateProperty.resolveWith(
                            (final Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return ThemeColors.cyan;
                              }

                              return ThemeColors.primaryBlack;
                            },
                          ),
                          trackOutlineColor: WidgetStateProperty.resolveWith(
                            (final Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return null;
                              }

                              return Colors.transparent;
                            },
                          ),
                          onChanged: (value) {
                            store!.dispatch(ThemeReducer(
                              action: ActionOperation.setTheme,
                               payload: store!.state.scheme == ThemeScheme.light ? ThemeScheme.dark : ThemeScheme.light
                              )
                            );
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
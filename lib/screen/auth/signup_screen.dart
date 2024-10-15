import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/template/route.dart';
import 'package:quickmart/template/theme_colors.dart';
import 'package:quickmart/utils/change_focus.dart';
import 'package:quickmart/widget/btn_block.dart';
import 'package:quickmart/widget/btn_blockv2.dart';
import 'package:quickmart/widget/password_icon.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode fullnameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  bool seePass = true;

  void toggle() {
    setState(() {
      seePass = !seePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    store!.state.scheme == ThemeScheme.light ? 
                    "assets/icon/app_icon/app_icon_no_label@2x.png" :
                    "assets/icon/app_icon/app_icon_dark_no_label@2x.png",
                    width: 104,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Signup",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: ThemeColors.lightGrey2
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.pushReplacementNamed(context, RouteName.signIn);
                          },
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            color: ThemeColors.primaryColorLight
                          )
                        )
                      ]
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Full Name",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite
                      ),
                      children: [
                        TextSpan(
                          text: "*",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            color: ThemeColors.red
                          )
                        )
                      ]
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: fullnameController,
                    focusNode: fullnameFocus,
                    autocorrect: false,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      color: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input your fullname!";
                      }
                      return null;
                    },
                    onFieldSubmitted: (term) {
                      changeFocus(context, fullnameFocus, emailFocus);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryWhite : ThemeColors.primaryBlack,
                      hintText: "Fullname",
                      hintStyle: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: ThemeColors.lightGrey2
                      ),
                      errorStyle: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: ThemeColors.red
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.red
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.primaryColorLight
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.lightGrey2
                        )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.lightGrey1
                        )
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Email",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite
                      ),
                      children: [
                        TextSpan(
                          text: "*",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            color: ThemeColors.red
                          )
                        )
                      ]
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    focusNode: emailFocus,
                    autocorrect: false,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      color: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input your email address!";
                      }
                      return null;
                    },
                    onFieldSubmitted: (term) {
                      changeFocus(context, emailFocus, passwordFocus);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryWhite : ThemeColors.primaryBlack,
                      hintText: "Email",
                      hintStyle: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: ThemeColors.lightGrey2
                      ),
                      errorStyle: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: ThemeColors.red
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.red
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.primaryColorLight
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.lightGrey2
                        )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.lightGrey1
                        )
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Password",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite
                      ),
                      children: [
                        TextSpan(
                          text: "*",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            color: ThemeColors.red
                          )
                        )
                      ]
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocus,
                    autocorrect: false,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      color: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input your password!";
                      }
                      return null;
                    },
                    onFieldSubmitted: (term) {
                      passwordFocus.unfocus();
                    },
                    obscureText: seePass,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryWhite : ThemeColors.primaryBlack,
                      hintText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          toggle();
                        },
                        icon: PasswordIcon(seePass: seePass),
                      ),
                      hintStyle: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: ThemeColors.lightGrey2
                      ),
                      errorStyle: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: ThemeColors.red
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.red
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.primaryColorLight
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.lightGrey2
                        )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: ThemeColors.lightGrey1
                        )
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BtnBlock(
                    backgroundColor: ThemeColors.instance.btnColorBlock(store!.state.scheme),
                    txtColor: ThemeColors.instance.btnColorBlockTxt(store!.state.scheme),
                    title: "Create Account",
                    onTap: () {
                      // Navigator.pushReplacementNamed(context, RouteName.signUp);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BtnBlockV2(
                    backgroundColor: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryWhite : ThemeColors.primaryBlack,
                    title: "Signup with Google",
                    txtColor: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite,
                    onTap: () {},
                    useBgColor: true,
                    useBorder: true,
                    icon: Brand(Brands.google),
                    borderColor: ThemeColors.lightGrey2,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
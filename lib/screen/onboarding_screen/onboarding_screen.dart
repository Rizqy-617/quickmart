import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/template/route.dart';
import 'package:quickmart/template/theme_colors.dart';
import 'package:quickmart/widget/btn_block.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  void _skipToEnd() {
    _introKey.currentState?.skipToEnd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
      body: SafeArea(
        child: IntroductionScreen(
          key: _introKey,
          onDone: () {},
          showDoneButton: false,
          showNextButton: false,
          controlsPadding: const EdgeInsets.all(10),
          globalBackgroundColor: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
          dotsDecorator: DotsDecorator(
            activeColor: ThemeColors.primaryColorLight
          ),
          pages: [
            PageViewModel(
              decoration: const PageDecoration(
                imageFlex: 4,
                bodyFlex: 3,
                footerFlex: 3,
                pageMargin: EdgeInsets.only(bottom: 0),
                contentMargin: EdgeInsets.only(bottom: 0, left: 16, right: 16),
                footerPadding: EdgeInsets.symmetric(vertical: 0),
                titlePadding: EdgeInsets.only(bottom: 10),
                footerFit: FlexFit.tight
              ),
              titleWidget: Text(
                "Explore a wide range\n of products",
                softWrap: true,
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite,
                ),
              ),
              bodyWidget: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.",
                        maxLines: 3,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          color: ThemeColors.lightGrey2
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      child: BtnBlock(
                        backgroundColor: ThemeColors.instance.btnColorBlock(store!.state.scheme),
                        txtColor: ThemeColors.instance.btnColorBlockTxt(store!.state.scheme),
                        title: "Next",
                        onTap: () {
                          _introKey.currentState?.next();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              image: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: ThemeColors.instance.primaryContainerColor(store!.state.scheme)
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          store!.state.scheme == ThemeScheme.light ? 
                          "assets/icon/app_icon/app_icon_no_label@2x.png" :
                          "assets/icon/app_icon/app_icon_dark_no_label@2x.png",
                          width: 104,
                          height: 40,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            _skipToEnd();
                          },
                          child: Text(
                            "Skip for now",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ThemeColors.primaryColorLight
                            ),
                          )
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/icon/onboarding/boarding1.png",
                          width: 240,
                          height: 240,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
            PageViewModel(
              decoration: const PageDecoration(
                imageFlex: 4,
                bodyFlex: 3,
                footerFlex: 3,
                pageMargin: EdgeInsets.only(bottom: 0),
                contentMargin: EdgeInsets.only(bottom: 0, left: 16, right: 16),
                footerPadding: EdgeInsets.symmetric(vertical: 0),
                titlePadding: EdgeInsets.only(bottom: 10),
                footerFit: FlexFit.tight
              ),
              titleWidget: Text(
                "Unlock exclusive offers\n and discount",
                softWrap: true,
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite,
                ),
              ),
              bodyWidget: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "Get access to limited-time deals and special promotions available only to our valued customers.",
                        maxLines: 3,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          color: ThemeColors.lightGrey2
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      child: BtnBlock(
                        backgroundColor: ThemeColors.instance.btnColorBlock(store!.state.scheme),
                        txtColor: ThemeColors.instance.btnColorBlockTxt(store!.state.scheme),
                        title: "Next",
                        onTap: () {
                          _introKey.currentState?.next();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              image: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: ThemeColors.instance.primaryContainerColor(store!.state.scheme)
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          store!.state.scheme == ThemeScheme.light ? 
                          "assets/icon/app_icon/app_icon_no_label@2x.png" :
                          "assets/icon/app_icon/app_icon_dark_no_label@2x.png",
                          width: 104,
                          height: 40,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            _skipToEnd();
                          },
                          child: Text(
                            "Skip for now",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ThemeColors.primaryColorLight
                            ),
                          )
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/icon/onboarding/boarding2.png",
                          width: 240,
                          height: 240,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
            PageViewModel(
              decoration: const PageDecoration(
                imageFlex: 4,
                bodyFlex: 3,
                footerFlex: 3,
                pageMargin: EdgeInsets.only(bottom: 0),
                contentMargin: EdgeInsets.only(bottom: 0, left: 16, right: 16),
                footerPadding: EdgeInsets.symmetric(vertical: 0),
                titlePadding: EdgeInsets.only(bottom: 10),
                footerFit: FlexFit.tight
              ),
              titleWidget: Text(
                "Safe and secure\n payments",
                softWrap: true,
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite,
                ),
              ),
              bodyWidget: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        " QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.",
                        maxLines: 3,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          color: ThemeColors.lightGrey2
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      child: BtnBlock(
                        backgroundColor: ThemeColors.instance.btnColorBlock(store!.state.scheme),
                        txtColor: ThemeColors.instance.btnColorBlockTxt(store!.state.scheme),
                        title: "Get Started",
                        onTap: () {
                          Navigator.pushReplacementNamed(context, RouteName.signUp);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              image: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: ThemeColors.instance.primaryContainerColor(store!.state.scheme)
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          store!.state.scheme == ThemeScheme.light ? 
                          "assets/icon/app_icon/app_icon_no_label@2x.png" :
                          "assets/icon/app_icon/app_icon_dark_no_label@2x.png",
                          width: 104,
                          height: 40,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/icon/onboarding/boarding3.png",
                          width: 240,
                          height: 240,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
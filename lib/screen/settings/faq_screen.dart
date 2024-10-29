import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/template/theme_colors.dart';

class FrequentlyAskScreen extends StatelessWidget {
  const FrequentlyAskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
        scrolledUnderElevation: 0,
        leadingWidth: 30,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
          ),
        ),
        title: Text(
          "FAQs",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme),
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      backgroundColor: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Can I cancel my order?",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Yes only if the order is not dispatched yet. You can contact our customer service department to get your order canceled.",
                maxLines: 6,
                softWrap: true,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Will I receive the same product I see in the photo?",
                softWrap: true,
                maxLines: 2,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Actual product color may vary from the images shown. Every monitor or mobile display has a different capability to display colors, and every individual may see these colors differently. In addition, lighting conditions at the time the photo was taken can also affect an image's color.",
                maxLines: 12,
                softWrap: true,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "How can I recover the forgotten password?",
                softWrap: true,
                maxLines: 2,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'If you have forgotten your password, you can recover it from "Login - Forgotten your password?" section. You will receive an e-mail with a link to enter and confirm your new password.',
                maxLines: 12,
                softWrap: true,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Is my personal information confidential?",
                softWrap: true,
                maxLines: 2,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Your personal information is confidential. We do not rent, sell, barter or trade email addresses. When you place an order with us, we collect your name, address, telephone number, credit card information and your email address. We use this information to fulfill your order and to communicate with you about your order. All your information is kept confidential and will not be disclosed to anybody unless ordered by government authorities.',
                maxLines: 12,
                softWrap: true,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "What payment methods can I use to make purchases?",
                softWrap: true,
                maxLines: 2,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'We offer the following payment methods: PayPal, VISA, MasterCard and Voucher code, if applicable.',
                maxLines: 12,
                softWrap: true,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "For any query, you can visit our website for ",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.lightGrey2
                  ),
                  children: [
                    TextSpan(
                      text: "Help Center",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.blue
                      ),
                    ),
                    TextSpan(
                      text: " at Quickmart.com",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.lightGrey2
                      ),
                    ),
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
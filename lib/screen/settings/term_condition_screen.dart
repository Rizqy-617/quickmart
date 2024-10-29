import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/template/theme_colors.dart';

class TermConditionScreen extends StatelessWidget {
  const TermConditionScreen({super.key});

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
          "Terms & Conditions",
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
                "Terms & Conditions",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Welcome to QuickMart! These Terms and Conditions ("Terms") govern your use of our e-commerce app. By accessing or using QuickMart, you agree to be bound by these Terms. Please read them carefully before proceeding.',
                maxLines: 10,
                softWrap: true,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "1. Account Registration:",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BulletedList(
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                bulletType: BulletType.conventional,
                listItems: const [
                  "You must create an account to use certain features of QuickMart.",
                  "You are responsible for providing accurate and up-to-date information during the registration process.",
                  "You must safeguard your account credentials and notify us immediately of any unauthorized access or use of your account."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "2. Product Information and Pricing:",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BulletedList(
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                bulletType: BulletType.conventional,
                listItems: const [
                  "QuickMart strives to provide accurate product descriptions, images, and pricing information.",
                  "We reserve the right to modify product details and prices without prior notice.",
                  "In the event of an error, we may cancel or refuse orders placed for incorrectly priced products."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "3. Order Placement and Fulfillment:",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BulletedList(
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                bulletType: BulletType.conventional,
                listItems: const [
                  "By placing an order on QuickMart, you agree to purchase the selected products at the stated price.",
                  "We reserve the right to accept or reject any order, and we may cancel orders due to product unavailability, pricing errors, or suspected fraudulent activity.",
                  "Once an order is confirmed, we will make reasonable efforts to fulfill and deliver it in a timely manner."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "4. Payment:",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BulletedList(
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                bulletType: BulletType.conventional,
                listItems: const [
                  "QuickMart supports various payment methods, including credit/debit cards and online payment platforms.",
                  "By providing payment information, you represent and warrant that you are authorized to use the chosen payment method.",
                  "All payments are subject to verification and approval by relevant financial institutions."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "5. Shipping and Delivery:",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BulletedList(
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                bulletType: BulletType.conventional,
                listItems: const [
                  "QuickMart will make reasonable efforts to ensure timely delivery of products.",
                  "Shipping times may vary based on factors beyond our control, such as location, weather conditions, or carrier delays.",
                  "Risk of loss or damage to products passes to you upon delivery."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "6. Returns and Refunds:",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BulletedList(
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                bulletType: BulletType.conventional,
                listItems: const [
                  "QuickMart's return and refund policies are outlined separately and govern the process for returning products and seeking refunds.",
                  "Certain products may be non-returnable or subject to specific conditions."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "7. Intellectual Property:",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BulletedList(
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                bulletType: BulletType.conventional,
                listItems: const [
                  "QuickMart and its content, including logos, trademarks, text, images, and software, are protected by intellectual property rights.",
                  "You may not use, reproduce, modify, distribute, or display any part of QuickMart without our prior written consent."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "8. User Conduct:",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BulletedList(
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                bulletType: BulletType.conventional,
                listItems: const [
                  "You agree to use QuickMart in compliance with applicable laws and regulations.",
                  "You will not engage in any activity that disrupts or interferes with the functioning of QuickMart or infringes upon the rights of others."
                  "Any unauthorized use or attempt to access restricted areas or user accounts is strictly prohibited."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "9. Limitation of Liability:",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BulletedList(
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                bulletType: BulletType.conventional,
                listItems: const [
                  "QuickMart and its affiliates shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising from the use or inability to use our app or any products purchased through it.",
                  "We do not guarantee the accuracy, completeness, or reliability of information provided on QuickMart."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "10. Governing Law:",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.instance.btnColorBlockTxt2(store!.state.scheme)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BulletedList(
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                bulletType: BulletType.conventional,
                listItems: const [
                  "These Terms shall be governed by and construed in accordance with the laws of [Jurisdiction].",
                  "Any disputes arising out of or relating to these Terms shall be resolved in the courts of [Jurisdiction]."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "If you have any questions or concerns regarding these Terms and Conditions, please contact our customer support. By using QuickMart, you acknowledge that you have read, understood, and agreed to these Terms and Conditions.",
                maxLines: 10,
                softWrap: true,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.lightGrey2
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
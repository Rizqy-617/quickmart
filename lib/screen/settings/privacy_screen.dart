import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/template/theme_colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          "Privacy Policy",
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
                "Our Policy",
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
                "At QuickMart, we are committed to protecting the privacy and security of our users' personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard the information obtained through our e-commerce app. By using QuickMart, you consent to the practices described in this policy.",
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
                "1. Information Collection:",
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
                  "Personal Information: We may collect personal information such as name, address, email, and phone number when you create an account, make a purchase, or interact with our services.",
                  "Transaction Details: We collect information related to your purchases, including order history, payment method, and shipping details.",
                  "Usage Data: We may collect data on how you interact with our app, such as browsing activity, search queries, and preferences."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "2. Information Use:",
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
                  "Provide Services: We use the collected information to process orders, deliver products, and provide customer support.",
                  "Personalization: We may use your information to personalize your shopping experience, recommend products, and display targeted advertisements.",
                  "Communication: We may use your contact information to send important updates, promotional offers, and newsletters. You can opt-out of these communications at any time."
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "3. Information Sharing:",
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
                  "Third-Party Service Providers: We may share your information with trusted third-party service providers who assist us in operating our app, fulfilling orders, and improving our services.",
                  "Legal Compliance: We may disclose personal information if required by law or in response to a valid legal request from authorities.",
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "4. Data Security:",
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
                  "We implement appropriate security measures to protect your information from unauthorized access, alteration, disclosure, or destruction.",
                  "However, please note that no data transmission over the internet or electronic storage is 100% secure. We cannot guarantee absolute security of your information.",
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "5. User Rights:",
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
                  "Access and Update: You have the right to access, correct, or update your personal information stored in our app.",
                  "Data Retention: We retain your personal information as long as necessary to provide our services and comply with legal obligations.",
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "6. Children's Privacy:",
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
                  "QuickMart is not intended for children under the age of 13. We do not knowingly collect or solicit personal information from children.",
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "7. Updates to the Privacy Policy:",
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
                  "We reserve the right to update this Privacy Policy from time to time. Any changes will be posted on our app, and the revised policy will be effective upon posting.",
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "If you have any questions or concerns about our Privacy Policy, please contact our customer support. By using QuickMart, you acknowledge that you have read and understood this Privacy Policy and agree to its terms and conditions.",
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
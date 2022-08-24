import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Auth/Auth%20Components/auth_appbar.dart';
import 'package:reasa/UI/Auth/Auth%20Components/auth_top_icon.dart';
import 'package:reasa/View%20Models/Auth%20View%20Model/auth_view_model.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

class GetEmail extends StatelessWidget {
  GetEmail({Key? key}) : super(key: key);

  final auth = Get.find<AuthViewModel>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: authAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            authTopIcon(
              const Icon(
                Icons.mail,
                size: 35,
                color: kclrPrimaryColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            poppinsText(
              "What's your email?",
              size: 19,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 10.h,
            ),
            poppinsText(
              "We'll check if you have an account",
              size: 13,
              weight: FontWeight.w300,
              color: Colors.grey[600],
            ),
            SizedBox(
              height: 15.h,
            ),
            textFieldWithTitle(
              "Email",
              emailController,
              type: TextInputType.emailAddress,
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        child: longButton(
          title: "Continue",
          onTap: () {
            if (emailController.text != "") {
              auth.checkIfExists(emailController.text.trim()).then((value) {
                if (value == 0) {
                  auth.getToPassword(email: emailController.text.trim());
                } else if (value == 1) {
                  errorSnack(
                    "This email is used on a social login. Please login with Google using the same email",
                  );
                } else {
                  auth.getToSignup(email: emailController.text.trim());
                }
              });
            } else {
              errorSnack("Please enter email address");
            }
          },
          color: kclrPrimaryColor,
          textColor: Colors.white,
          borderColor: kclrPrimaryColor,
        ),
      ),
    );
  }
}

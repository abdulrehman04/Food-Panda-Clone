import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Auth/Auth%20Components/auth_appbar.dart';
import '../../View Models/Auth View Model/auth_view_model.dart';
import '../../constants.dart';
import '../../widgets.dart';
import 'Auth Components/auth_top_icon.dart';

class Signup extends StatelessWidget {
  final String email;
  Signup({Key? key, this.email = ""}) : super(key: key) {
    print(email);
    emailController.text = email;
  }

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
                Icons.person,
                size: 35,
                color: kclrPrimaryColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            poppinsText(
              "Let's get you started!",
              size: 19,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 10.h,
            ),
            poppinsText(
              "First, create your foodpanda (Ghurbat Variant) account",
              size: 13,
              weight: FontWeight.w300,
              color: Colors.grey[600],
            ),
            SizedBox(
              height: 15.h,
            ),
            textFieldWithTitle("Email", emailController),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Expanded(
                  child: textFieldWithTitle("First Name", null),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: textFieldWithTitle("Last Name", null),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            textFieldWithTitle("Password", null),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        child: longButton(
          title: "Continue",
          onTap: () {
            auth.getToSignup();
          },
          color: kclrPrimaryColor,
          textColor: Colors.white,
          borderColor: kclrPrimaryColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Auth/Auth%20Components/auth_appbar.dart';
import 'package:reasa/UI/Dashboard/Home/home.dart';
import '../../View Models/Auth View Model/auth_view_model.dart';
import '../../constants.dart';
import '../../widgets.dart';
import 'Auth Components/auth_top_icon.dart';

class Signup extends StatelessWidget {
  final String email;
  Signup({Key? key, this.email = ""}) : super(key: key) {
    emailController.text = email;
  }

  final auth = Get.find<AuthViewModel>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController password = TextEditingController();
  RxBool isSubmitting = RxBool(false);

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
                  child: textFieldWithTitle("First Name", firstName),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: textFieldWithTitle("Last Name", lastName),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            textFieldWithTitle("Password", password),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        child: Obx(() {
          return isSubmitting.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kclrPrimaryColor,
                  ),
                )
              : longButton(
                  title: "Signup!",
                  onTap: () {
                    isSubmitting.value = true;
                    auth
                        .signupEmail(
                      email: emailController.text.trim(),
                      password: password.text.trim(),
                      first: firstName.text.trim(),
                      last: lastName.text.trim(),
                    )
                        .then((_) {
                      Get.offUntil(
                        MaterialPageRoute(builder: (context) => const Home()),
                        (route) => false,
                      );
                    }).onError((error, stackTrace) {
                      isSubmitting.value = false;
                      errorSnack(error.toString());
                    });
                  },
                  color: kclrPrimaryColor,
                  textColor: Colors.white,
                  borderColor: kclrPrimaryColor,
                );
        }),
      ),
    );
  }
}

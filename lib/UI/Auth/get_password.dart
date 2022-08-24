import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Auth/Auth%20Components/auth_appbar.dart';
import 'package:reasa/UI/Auth/Auth%20Components/auth_top_icon.dart';
import 'package:reasa/UI/Dashboard/home.dart';
import 'package:reasa/View%20Models/Auth%20View%20Model/auth_view_model.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

class GetPassword extends StatelessWidget {
  String email;
  GetPassword({Key? key, this.email = ""}) : super(key: key) {
    emailController.text = email;
  }

  final auth = Get.find<AuthViewModel>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                Icons.shield,
                size: 35,
                color: kclrPrimaryColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            poppinsText(
              "Login with your email",
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
              enabled: false,
            ),
            SizedBox(
              height: 20.h,
            ),
            textFieldWithTitle(
              "Password",
              passwordController,
              type: TextInputType.visiblePassword,
            ),
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
                  title: "Continue",
                  onTap: () {
                    if (emailController.text != "") {
                      isSubmitting.value = true;
                      auth
                          .emailLogin(emailController.text.trim(),
                              passwordController.text.trim())
                          .then((value) {
                        Get.offUntil(
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                            (route) => false);
                        // successSnack(msg)
                      }).onError((error, stackTrace) {
                        errorSnack(error);
                      });
                    } else {
                      isSubmitting.value = false;
                      errorSnack("Please fill all fields");
                    }
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reasa/UI/Auth/Auth%20Components/auth_appbar.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

class GetEmail extends StatelessWidget {
  const GetEmail({Key? key}) : super(key: key);

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
            Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: const Icon(
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
            textFieldWithTitle("Email", null)
          ],
        ),
      ),
      bottomSheet: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        child: longButton(
          title: "Continue",
          onTap: null,
          color: kclrPrimaryColor,
          textColor: Colors.white,
          borderColor: kclrPrimaryColor,
        ),
      ),
    );
  }
}

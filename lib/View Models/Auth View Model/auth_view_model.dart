import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reasa/UI/Auth/Auth%20Components/auth_bottom_sheet.dart';
import 'package:reasa/widgets.dart';

class AuthViewModel extends GetxController {
  showBottomModel(onGoogleClick) {
    return authBottomSheet(onGoogleClick);
  }

  googleLogin() {
    Get.back();
    GoogleSignIn().signOut().then((_) {
      GoogleSignIn().signIn().then((value) async {
        successSnack("Logged in as ${value!.displayName}");
        // final GoogleSignInAuthentication googleAuth =
        //     await value!.authentication;

        // final credential = GoogleAuthProvider.credential(
        //   accessToken: googleAuth.accessToken,
        //   idToken: googleAuth.idToken,
        // );

        // FirebaseAuth.instance.signInWithCredential(credential).then((value){

        // });
      });
    });
  }
}

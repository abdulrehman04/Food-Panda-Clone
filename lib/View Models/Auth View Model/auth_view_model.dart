import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reasa/UI/Auth/Auth%20Components/auth_bottom_sheet.dart';
import 'package:reasa/UI/Auth/get_email.dart';
import 'package:reasa/widgets.dart';

class AuthViewModel extends GetxController {
  showBottomModel(onGoogleClick, onEmailClick) {
    return authBottomSheet(onGoogleClick, onEmailClick);
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

  pushToEmail() {
    Get.back();
    Get.to(() => const GetEmail());
  }
}

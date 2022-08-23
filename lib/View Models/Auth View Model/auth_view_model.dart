import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reasa/Model/user_model.dart';
import 'package:reasa/UI/Auth/Auth%20Components/auth_bottom_sheet.dart';
import 'package:reasa/UI/Auth/get_email.dart';
import 'package:reasa/UI/Auth/signup.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

class AuthViewModel extends GetxController {
  late UserModel currentUser;
  bool loggedIn = false;

  showBottomModel(onGoogleClick, onEmailClick) {
    return authBottomSheet(onGoogleClick, onEmailClick);
  }

  getToSignup({email = ""}) {
    Get.to(() => Signup(email: email));
  }

  get fullName => "${currentUser.firstName} ${currentUser.secondName}";

  googleLogin() {
    Get.back();
    GoogleSignIn().signOut().then((_) {
      GoogleSignIn().signIn().then((google) async {
        final GoogleSignInAuthentication googleAuth =
            await google!.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        FirebaseAuth.instance.signInWithCredential(credential).then((authUser) {
          FirebaseFirestore.instance
              .collection("Users")
              .doc(authUser.user!.uid)
              .get()
              .then((value) async {
            if (value.exists) {
              setUserData(
                firstName: value['firstName'],
                secondName: value['lastName'],
                email: value['email'],
                uid: value.id,
              );
            } else {
              var names = google.displayName!.split(' ');
              await pushUserToDb(
                google.email,
                names[0],
                names[1],
                authUser.user!.uid,
              );
              setUserData(
                firstName: names[0],
                secondName: names[1],
                email: google.email,
                uid: authUser.user!.uid,
              );
            }
          });
        });
      });
    });
  }

  setUserData({firstName, secondName, email, uid}) {
    loggedIn = true;
    currentUser = UserModel(
      firstName: firstName,
      secondName: secondName,
      email: email,
      uid: uid,
    );
    successSnack("Logged in as ${currentUser.firstName}");
  }

  Future pushUserToDb(email, first, last, uid) async {
    await db.collection("Users").doc(uid).set({
      "firstName": first,
      "lastName": last,
      'email': email,
    });
    return true;
  }

  pushToEmail() {
    Get.back();
    Get.to(() => GetEmail());
  }
}

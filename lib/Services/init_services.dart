import 'package:get/get.dart';
import 'package:reasa/Services/Shared%20Preferences/shared_preferences.dart';

initServices() {
  SharedPreferencesService sp = Get.put(SharedPreferencesService());
}

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxController {
  late SharedPreferences sp;

  SharedPreferencesService() {
    init();
  }

  init() async {
    sp = await SharedPreferences.getInstance();
    print("Initialised");
  }

  saveList(key, List<String> list) {
    sp.setStringList(key, list);
  }

  List<String>? getList(key) {
    return sp.getStringList(key);
  }
}

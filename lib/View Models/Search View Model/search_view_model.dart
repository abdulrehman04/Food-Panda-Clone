import 'package:get/get.dart';
import 'package:reasa/Services/Shared%20Preferences/shared_preferences.dart';

class SearchViewModel extends GetxController {
  SharedPreferencesService sp = Get.find<SharedPreferencesService>();
  RxList<String>? recentSearches = RxList([]);

  SearchViewModel() {
    List<String>? data = getRecentSearches();
    if (data != null) {
      recentSearches!.value = data;
    }
  }
  List<String>? getRecentSearches() {
    return sp.getList("recentSearches");
  }

  removeRecentSearch(e) {
    recentSearches!.remove(e);
  }

  setRecentSearches() {
    sp.saveList("recentSearches", recentSearches!.value);
  }
}

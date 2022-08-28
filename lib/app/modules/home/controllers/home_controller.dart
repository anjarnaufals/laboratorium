import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeController extends GetxController {
  final filter = <Filter>[].obs;
  final refreshController = RefreshController();
  var selectedFilter = [].obs;
  var isLoading = false.obs;
  var filterName = "Filter".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // loadFilters();
  }

  @override
  void onClose() {}

  Future<void> loadFilters() async {
    isLoading(true);
    await Future.delayed(Duration(seconds: 1), () {
      var temp = <Filter>[
        Filter(id: "newest", filter: "Terbaru"),
        Filter(id: "best-seller", filter: "Terlaris"),
        Filter(id: "cheapest", filter: "Termurah"),
        Filter(id: "highest", filter: "Termahal"),
        Filter(id: "az", filter: "A - z"),
      ];
      filter.value = temp;
      isLoading(false);
    });
  }

  void onRefresh() {
    loadFilters();
  }

  void selectFilter(String selected) {
    //check if list of selected filter length more than zero
    if (selectedFilter.length > 0) {
      // check if list of selected filter contains element "selected" parameter
      if (selectedFilter.contains(selected)) {
        selectedFilter.clear();
      } else {
        selectedFilter.removeAt(0);
        selectedFilter.add(selected);
        helper(selected);
      }
    } else {
      selectedFilter.add(selected);

      helper(selected);
    }

    print(selectedFilter);
  }

  selected(String selected) {
    if (selectedFilter.contains(selected)) {
      return true;
    } else {
      return false;
    }
  }

  helper(String selected) {
    for (var element in filter) {
      if (selected == element.id) {
        filterName.value = element.filter;
      }
    }
  }
}

class Filter {
  String id;
  String filter;
  Filter({required this.id, required this.filter});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["filter"] = filter;
    return data;
  }
}

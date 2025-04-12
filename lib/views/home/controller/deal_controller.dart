import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:deal_app/data/local/database_helper.dart';
import 'package:deal_app/data/models/deal_model.dart';
import 'package:deal_app/data/repo/deal_repo.dart';

class DealController extends GetxController {
  final String type;
  DealController(this.type);
  final DealRepository _repo = DealRepository();
  var deals = <DealModel>[].obs;
  var isLoading = false.obs;
  var page = 1;

  @override
  void onInit() {
    fetchDeals(refresh: true);
    super.onInit();
  }
  void fetchDeals({bool refresh = false}) async {
    if (isLoading.value) return;
    isLoading.value = true;
    if (refresh) {
      page = 1;
      deals.clear();
    }
    try {
      final hasConnection = await Connectivity().checkConnectivity();
      if (hasConnection.contains(ConnectivityResult.none)) {
        // No internet, load from local db
        final localDeals = await DatabaseHelper.instance.getDealsByType(type);
        if (localDeals.isNotEmpty) {
          deals.assignAll(localDeals);
        } else {
          Get.snackbar('Offline Mode', 'No local data available',
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        // Online: fetch from API and store to local
        final result = await _repo.getDeals(type, page);
        if (refresh) {
          await DatabaseHelper.instance.deleteDealsByType(type);
        }
        await DatabaseHelper.instance.insertDealsBulk(result,type);
        deals.addAll(result);
        page++;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}

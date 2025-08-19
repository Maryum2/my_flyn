// lib/controllers/campaign_controller.dart
import 'package:get/get.dart';
import 'package:my_flyn/mock/mock_compaign.dart';
import 'package:my_flyn/models/compaigns.dart';

class CampaignController extends GetxController {
  final currentTab = 0.obs;
  void setTab(int i) => currentTab.value = i;

  var campaigns = <Campaign>[].obs;

  @override
  void onInit() {
    super.onInit();
    campaigns.assignAll(mockCampaigns); // load mock data
  }

  void toggleLike(String id) {
    final index = campaigns.indexWhere((c) => c.id == id);
    if (index != -1) {
      campaigns[index].liked = !campaigns[index].liked;
      campaigns.refresh(); // force Obx to update
    }
  }
}

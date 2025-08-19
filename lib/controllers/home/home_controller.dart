import 'package:get/get.dart';

class HomeController extends GetxController {
  // Current tab index on the My Page counters (신청/진행/완료)
  final currentStatusTab = 1.obs; // 0:신청,1:진행,2:완료

  void setTab(int index) => currentStatusTab.value = index;
}
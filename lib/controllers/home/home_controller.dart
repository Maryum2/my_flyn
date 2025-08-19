import 'package:get/get.dart';

class HomeController extends GetxController {
  // Current tab index on the My Page counters 
  final currentStatusTab = 1.obs; 

  void setTab(int index) => currentStatusTab.value = index;
}
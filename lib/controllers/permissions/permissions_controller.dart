import 'package:flutter/services.dart';
import 'package:get/get.dart';

// Handles runtime permissions via a native MethodChannel.
// Android and iOS both  implemented natively
class PermissionController extends GetxController {
  static const _channel = MethodChannel('com.example.app/permissions');

  // Rx state used by Obx builders
  final cameraGranted = false.obs;
  final isChecking = false.obs;

  // Checks the current camera permission without prompting.
  Future<void> checkCamera() async {
    try {
      isChecking.value = true;
      final granted = await _channel.invokeMethod<bool>('checkCamera');
      cameraGranted.value = granted ?? false;
    } on PlatformException catch (e) {
      Get.snackbar('Permission', 'Failed to check: ${e.message}');
    } finally {
      isChecking.value = false;
    }
  }

  // Requests camera permission
  Future<void> requestCamera() async {
    try {
      isChecking.value = true;
      final granted = await _channel.invokeMethod<bool>('requestCamera');
      cameraGranted.value = granted ?? false;
      if (cameraGranted.value) {
        Get.snackbar('Permission', 'Camera permission granted');
      } else {
        Get.snackbar('Permission', 'Camera permission denied');
      }
    } on PlatformException catch (e) {
      Get.snackbar('Permission', 'Error: ${e.message}');
    } finally {
      isChecking.value = false;
    }
  }
}

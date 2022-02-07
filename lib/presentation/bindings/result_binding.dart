import 'package:get/instance_manager.dart';

import '../controllers/ad_controller.dart';

class ResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AdController(),
    );
  }
}

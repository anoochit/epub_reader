import 'package:epub_reader/app/modules/read/controllers/read_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ReadController>(
      () => ReadController(),
    );
  }
}

import 'dart:developer';

import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';

class ReadController extends GetxController {
  //
  RxString title = ''.obs;
  RxString asset = ''.obs;

  late EpubController epubController;

  @override
  void onInit() {
    super.onInit();
    log('onInit');
    title.value = Get.parameters['title'] ?? '';
    asset.value = Get.parameters['asset'] ?? '';

    epubController = EpubController(
      document: EpubDocument.openAsset(asset.value),
    );
  }
}

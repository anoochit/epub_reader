import 'dart:developer';

import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';

class ReadController extends GetxController {
  //
  RxString title = ''.obs;
  RxString asset = ''.obs;
  late EpubController epubController;

  RxDouble fontSize = 1.0.obs;
  RxDouble lineHeight = 1.75.obs;
  RxInt fontFace = 0.obs;
  RxInt viewingTheme = 0.obs;
  RxBool showSettings = false.obs;

  @override
  void onInit() {
    log('onInit');
    title.value = Get.parameters['title'] ?? '';
    asset.value = Get.parameters['asset'] ?? '';

    epubController = EpubController(
      document: EpubDocument.openAsset(asset.value),
    );

    super.onInit();
  }
}

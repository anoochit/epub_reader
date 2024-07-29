import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_theme.dart';
import '../controllers/read_controller.dart';

class ReadView extends GetView<ReadController> {
  const ReadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
        centerTitle: false,
        backgroundColor: AppTheme(context).appBarBackgroundColor,
      ),
      body: Obx(
        () => EpubView(
          controller: controller.epubController,
          onDocumentError: (error) => Text('$error'),
          builders: EpubViewBuilders<DefaultBuilderOptions>(
            chapterDividerBuilder: (value) => Container(),
            options: DefaultBuilderOptions(
              textStyle: GoogleFonts.sarabun(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
                height: 2.5,
              ),
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: GetBuilder<ReadController>(
          builder: (controller) => EpubViewTableOfContents(
            controller: controller.epubController,
            itemBuilder: (context, index, chapter, itemCount) {
              return ListTile(
                title: Text(chapter.title!),
                onTap: () {
                  controller.epubController.scrollTo(index: chapter.startIndex);
                  Get.back();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

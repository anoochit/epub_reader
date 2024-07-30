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
    return GestureDetector(
      onTap: () {
        if (controller.showSettings.value) {
          controller.showSettings.value = false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(controller.title.value)),
          backgroundColor: AppTheme(context).appBarBackgroundColor,
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                controller.showSettings.value = !controller.showSettings.value;
              },
              icon: const Icon(Icons.format_size),
            )
          ],
        ),
        body: Obx(
          () => Stack(
            children: [
              // reader
              Container(
                color: viewingThemes[controller.viewingTheme.value]
                    .backgroundColor,
                child: EpubView(
                  controller: controller.epubController,
                  onDocumentError: (error) => Text('$error'),
                  builders: EpubViewBuilders<DefaultBuilderOptions>(
                    chapterDividerBuilder: (value) => Container(),
                    options: DefaultBuilderOptions(
                      textStyle: listTypeFace[controller.fontFace.value]
                          .style
                          .copyWith(
                            fontSize: (16.0 * controller.fontSize.value),
                            height: (1.0 * controller.lineHeight.value),
                            color: viewingThemes[controller.viewingTheme.value]
                                .color,
                            backgroundColor:
                                viewingThemes[controller.viewingTheme.value]
                                    .backgroundColor,
                          ),
                    ),
                  ),
                ),
              ),

              // settings
              Positioned(
                top: 0,
                right: 0,
                child: AnimatedOpacity(
                  opacity: (controller.showSettings.value) ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 350),
                  child: Container(
                    width: 220,
                    height: 244,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(4.0),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary,
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8.0),
                        // font
                        SizedBox(
                          height: 64,
                          child: Expanded(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children:
                                  List.generate(listTypeFace.length, (index) {
                                return FontButton(
                                  text: 'ป',
                                  style: listTypeFace[index].style,
                                  label: listTypeFace[index].label,
                                  isSelected:
                                      (controller.fontFace.value == index),
                                  onTap: () {
                                    //
                                    controller.fontFace.value = index;
                                  },
                                );
                              }),
                            ),
                          ),
                        ),
                        // font size
                        LayoutBuilder(builder: (context, constraints) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FontSizeButton(
                                width: (constraints.maxWidth / 2.0) - 8,
                                height: 40.0,
                                icon: const Icon(Icons.text_decrease),
                                backgroundColor: Colors.white,
                                onTap: () {
                                  //
                                  if (controller.fontSize.value > 0.8) {
                                    controller.fontSize.value =
                                        controller.fontSize.value - 0.2;
                                  }
                                },
                              ),
                              FontSizeButton(
                                width: (constraints.maxWidth / 2.0) - 8,
                                height: 40.0,
                                icon: const Icon(Icons.text_increase),
                                backgroundColor: Colors.white,
                                onTap: () {
                                  //
                                  controller.fontSize.value =
                                      controller.fontSize.value + 0.2;
                                },
                              ),
                            ],
                          );
                        }),

                        // line height
                        LayoutBuilder(builder: (context, constraints) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FontSizeButton(
                                width: (constraints.maxWidth / 2.0) - 8,
                                height: 40.0,
                                icon: const Icon(Icons.density_small),
                                backgroundColor: Colors.white,
                                onTap: () {
                                  //
                                  if (controller.lineHeight.value > 1.75) {
                                    controller.lineHeight.value =
                                        controller.lineHeight.value - 0.5;
                                  }
                                },
                              ),
                              FontSizeButton(
                                width: (constraints.maxWidth / 2.0) - 8,
                                height: 40.0,
                                icon: const Icon(Icons.density_large),
                                backgroundColor: Colors.white,
                                onTap: () {
                                  //
                                  controller.lineHeight.value =
                                      controller.lineHeight.value + 0.5;
                                },
                              )
                            ],
                          );
                        }),

                        // themes
                        LayoutBuilder(builder: (context, constraints) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text('Viewing theme'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(viewingThemes.length,
                                    (index) {
                                  return Obx(
                                    () => ViewingThemeButton(
                                      width: (constraints.maxWidth / 3.0) - 8,
                                      height: 40.0,
                                      color: viewingThemes[index].color,
                                      backgroundColor:
                                          viewingThemes[index].backgroundColor,
                                      isSelected:
                                          (controller.viewingTheme.value ==
                                              index),
                                      onTap: () {
                                        controller.viewingTheme.value = index;
                                      },
                                    ),
                                  );
                                }),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: GetBuilder<ReadController>(
            builder: (controller) => EpubViewTableOfContents(
              controller: controller.epubController,
              itemBuilder: (context, index, chapter, itemCount) {
                return ListTile(
                  title: Text(chapter.title!),
                  onTap: () {
                    controller.epubController
                        .scrollTo(index: chapter.startIndex);
                    Get.back();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ViewingThemeButton extends StatelessWidget {
  const ViewingThemeButton({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.isSelected,
    required this.height,
    required this.width,
    required this.onTap,
  });

  final double height;
  final double width;
  final Color color;
  final Color backgroundColor;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Visibility(
            visible: isSelected,
            child: Icon(
              Icons.check,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class FontSizeButton extends StatelessWidget {
  const FontSizeButton(
      {super.key,
      required this.width,
      required this.height,
      required this.icon,
      required this.onTap,
      required this.backgroundColor});

  final double width;
  final double height;
  final Icon icon;
  final VoidCallback onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: icon,
        ),
      ),
    );
  }
}

class FontButton extends StatelessWidget {
  const FontButton({
    super.key,
    required this.text,
    required this.style,
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  final String text;
  final TextStyle style;
  final String label;
  final VoidCallback onTap;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => onTap(),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: (isSelected)
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(28.0),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: Center(
                child: Text(
                  text,
                  style: style,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TypeFace {
  String label;
  TextStyle style;
  TypeFace({
    required this.label,
    required this.style,
  });
}

final listTypeFace = [
  TypeFace(
    label: 'sarabun',
    style: GoogleFonts.sarabun(fontSize: 22.0),
  ),
  TypeFace(
    label: 'athiti',
    style: GoogleFonts.athiti(fontSize: 22.0),
  ),
  TypeFace(
    label: 'chakrapetch',
    style: GoogleFonts.chakraPetch(fontSize: 22.0),
  ),
  TypeFace(
    label: 'baiJamjuree',
    style: GoogleFonts.baiJamjuree(fontSize: 22.0),
  ),
  TypeFace(
    label: 'maitree',
    style: GoogleFonts.maitree(fontSize: 22.0),
  ),
];

class ViewingTheme {
  Color color;
  Color backgroundColor;
  ViewingTheme({
    required this.color,
    required this.backgroundColor,
  });
}

final viewingThemes = [
  ViewingTheme(
    color: Colors.black,
    backgroundColor: Colors.white,
  ),
  ViewingTheme(
    color: Colors.grey.shade900,
    backgroundColor: const Color(0xFFF5F0E3),
  ),
  ViewingTheme(
    color: Colors.grey.shade300,
    backgroundColor: Colors.grey.shade900,
  ),
];

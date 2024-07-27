import 'package:epub_reader/app/data/models/book_model.dart';
import 'package:epub_reader/app/modules/read/controllers/read_controller.dart';
import 'package:epub_reader/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BookItemView extends GetView {
  const BookItemView({super.key, required this.book, this.readButton = false});

  final Book book;
  final bool readButton;

  @override
  Widget build(BuildContext context) {
    final title = book.title;
    final author = book.author;
    final price = book.price;
    final id = book.id;
    final asset = 'assets/$id.epub';
    final image = book.image;

    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          InkWell(
            onTap: (readButton)
                ? () {
                    ReadController readController = Get.find<ReadController>();
                    readController.title.value = title;
                    readController.asset.value = asset;
                    Get.toNamed(Routes.READ);
                  }
                : null,
            child: Image.asset(
              image,
              width: (constraints.maxWidth * 0.8),
            ),
          ),
          Text(title),
          Text(author),
          Visibility(
            visible: (readButton == false),
            child: FilledButton(
              onPressed: () {
                // buy
              },
              child: Text('Buy $price'),
            ),
          ),
        ],
      ),
    );
  }
}

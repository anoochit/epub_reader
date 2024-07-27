import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/mock_data/library.dart';
import '../../../theme/app_theme.dart';
import '../../../views/views/book_item_view.dart';

class LibraryBodyView extends GetView {
  const LibraryBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        centerTitle: false,
        backgroundColor: AppTheme(context).appBarBackgroundColor,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AppTheme(context).getCrossAxisCount(),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 2 / 3,
        ),
        itemCount: libraryData.length,
        itemBuilder: (BuildContext context, int index) {
          final book = libraryData[index];

          return BookItemView(book: book, readButton: true);
        },
      ),
    );
  }
}

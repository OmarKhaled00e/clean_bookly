import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

class ResultListView extends StatelessWidget {
  const ResultListView({
    super.key,
    required this.books,
    required this.controller,
    required this.hasMore,
  });

  final List<BookEntity> books;
  final ScrollController controller;
  final bool hasMore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: hasMore ? books.length + 1 : books.length,
      itemBuilder: (context, index) {
        if (index < books.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BookListViewItem(books: books[index]),
          );
        } else {
          // Loader أسفل القائمة فقط عند التحميل
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomLoadingIndicator(),
          );
        }
      },
    );
  }
}

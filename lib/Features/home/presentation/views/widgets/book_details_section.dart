import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.books});
  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        // image
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustomBookImage(image: books.image ?? ''),
        ),
        Gap(43),
        // name
        Text(
          books.title,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        Gap(6),
        // outher
        Opacity(
          opacity: 0.7,
          child: Text(
            books.authorName ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Gap(18),
        // rating acount
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          reating: books.rating ?? 0,
          count: books.count ?? 0,
        ),
        Gap(37),
        // double button
        BookAction(book: books),
      ],
    );
  }
}

import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.books});
  final BookEntity books;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<NewsetBooksCubit>(context).fetchNewsetBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailsViewBody(books: widget.books)),
    );
  }
}


import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly/core/utils/function/build_error_snak_bar.dart';

import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({super.key});

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.message),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeaturedBooksListView(books: state.books);
        } else if (state is FeaturedBooksPaginationLoading) {
          return FeaturedBooksListView(books: state.oldBooks);
        } else if (state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(books: state.oldBooks);
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.message);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/core/utils/function/build_error_snak_bar.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBestSellerListViewBlocConsumer extends StatefulWidget {
  const FeaturedBestSellerListViewBlocConsumer({super.key});

  @override
  State<FeaturedBestSellerListViewBlocConsumer> createState() =>
      _FeaturedBestSellerListViewBlocConsumerState();
}

class _FeaturedBestSellerListViewBlocConsumerState
    extends State<FeaturedBestSellerListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsetBooksCubit, NewsetBooksState>(
      listener: (context, state) {
        if (state is NewsetBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is NewsetBooksPaginationFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(buildErrorWidget(state.errMassage));
        }
      },
      builder: (context, state) {
        if (state is NewsetBooksSuccess ||
            state is NewsetBooksPaginationLoading ||
            state is NewsetBooksPaginationFailure) {
          return BestSellerListView(books: books);
        } else if (state is NewsetBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMassage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}

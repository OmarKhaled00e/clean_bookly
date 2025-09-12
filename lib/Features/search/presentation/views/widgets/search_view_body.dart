import 'package:bookly/Features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'package:bookly/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/Features/search/presentation/views/widgets/result_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<SearchBooksCubit>().loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onSubmitted: (value) {
              context.read<SearchBooksCubit>().searchBooks(value);
            },
          ),
          const Gap(20),
          Text('Search Result', style: Styles.textStyle18),
          const Gap(20),
          Expanded(
            child: BlocBuilder<SearchBooksCubit, SearchBooksState>(
              builder: (context, state) {
                if (state is SearchBooksSuccess ||
                    state is SearchBooksPaginationLoading) {
                  final books = state is SearchBooksSuccess
                      ? state.books
                      : (state as SearchBooksPaginationLoading).currentBooks;
                  final hasMore = state is SearchBooksSuccess
                      ? state.hasReachedEnd
                      : true;

                  return ResultListView(
                    books: books,
                    controller: _scrollController,
                    hasMore: hasMore,
                  );
                } else if (state is SearchBooksFailure) {
                  return CustomErrorWidget(errMessage: state.errMassage);
                } else if (state is SearchBooksLoading) {
                  return const CustomLoadingIndicator();
                } else {
                  return const Center(child: Text('Search in book...'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

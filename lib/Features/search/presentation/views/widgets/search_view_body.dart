import 'package:bookly/Features/search/presentation/manager/cubit/search_book_cubit.dart';
import 'package:bookly/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/Features/search/presentation/views/widgets/result_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(onSubmitted: (value) {
              context.read<SearchBookCubit>().searchBooks(value);
            },
          ),
          Gap(20),
          Text('Search Result', style: Styles.textStyle18),
          Gap(20),
          Expanded(
            child: BlocBuilder<SearchBookCubit, SearchBookState>(
              builder: (context, state) {
                if (state is SearchBookSuccess) {
                  return ResultListView(books: state.books);
                } else if (state is SearchBookFailure) {
                  return CustomErrorWidget(errMessage: state.errMessage);
                } else if (state is SearchBookLoading) {
                  return CustomLoadingIndicator();
                } else {
                  return const Center(child: Text('Search in book....'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

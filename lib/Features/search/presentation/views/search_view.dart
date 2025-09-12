import 'package:bookly/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/Features/search/domain/use_cases/search_book_use_cases.dart';
import 'package:bookly/Features/search/presentation/manager/cubit/search_books_cubit.dart';

import 'package:bookly/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:bookly/core/utils/function/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              SearchBooksCubit(SearchBookUseCases(getIt.get<SearchRepoImpl>())),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}

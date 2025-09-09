import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fatch_featured_books_use_case.dart';
import 'package:flutter/material.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fatchFeaturedBooksUseCase)
    : super(FeaturedBooksInitial());
  final FatchFeaturedBooksUseCase fatchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBook() async {
    emit(FeaturedBooksLoading());

    var result = await fatchFeaturedBooksUseCase.call();

    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(failure.errMassage));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}

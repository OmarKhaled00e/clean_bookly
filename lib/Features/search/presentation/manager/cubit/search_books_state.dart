part of 'search_books_cubit.dart';

@immutable
sealed class SearchBooksState {}

final class SearchBooksInitial extends SearchBooksState {}


final class SearchBooksLoading extends SearchBooksState {}

final class SearchBooksPaginationLoading extends SearchBooksState {
  final List<BookEntity> currentBooks;
  SearchBooksPaginationLoading(this.currentBooks);
}

final class SearchBooksFailure extends SearchBooksState {
  final String errMassage;
  SearchBooksFailure(this.errMassage);
}

final class SearchBooksPaginationFailure extends SearchBooksState {
  final String errMassage;
  final List<BookEntity> currentBooks;
  SearchBooksPaginationFailure(this.errMassage, this.currentBooks);
}

final class SearchBooksSuccess extends SearchBooksState {
  final List<BookEntity> books;
  final bool hasReachedEnd;
  SearchBooksSuccess(this.books, {this.hasReachedEnd = false});
}
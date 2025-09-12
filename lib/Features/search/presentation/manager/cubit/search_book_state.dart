part of 'search_book_cubit.dart';

@immutable
sealed class SearchBookState {}

final class SearchBookInitial extends SearchBookState {}

class SearchBookLoading extends SearchBookState {}

class SearchBookSuccess extends SearchBookState {
  final List<BookEntity> books;

  SearchBookSuccess(this.books);
}

class SearchBookFailure extends SearchBookState {
  final String errMessage;
  SearchBookFailure(this.errMessage);
}

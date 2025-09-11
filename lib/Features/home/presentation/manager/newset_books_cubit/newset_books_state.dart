part of 'newset_books_cubit.dart';

@immutable
sealed class NewsetBooksState {}

final class NewsetBooksInitial extends NewsetBooksState {}

final class NewsetBooksLoading extends NewsetBooksState {}

final class NewsetBooksPaginationLoading extends NewsetBooksState {}

final class NewsetBooksPaginationFailure extends NewsetBooksState {
  final String errMassage;

  NewsetBooksPaginationFailure(this.errMassage);
}

final class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookEntity> books;

  NewsetBooksSuccess(this.books);
}

final class NewsetBooksFailure extends NewsetBooksState {
  final String errMassage;

  NewsetBooksFailure(this.errMassage);
}

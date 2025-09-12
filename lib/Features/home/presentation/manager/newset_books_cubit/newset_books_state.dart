part of 'newset_books_cubit.dart';

@immutable
sealed class NewsetBooksState {}

final class NewsetBooksInitial extends NewsetBooksState {}

final class NewsetBooksLoading extends NewsetBooksState {}

final class NewsetBooksPaginationLoading extends NewsetBooksState {
  final List<BookEntity> oldBooks;

  NewsetBooksPaginationLoading(this.oldBooks);
}

final class NewsetBooksPaginationFailure extends NewsetBooksState {
  final String errMassage;
  final List<BookEntity> oldBooks;

  NewsetBooksPaginationFailure(this.errMassage, this.oldBooks);
}

final class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookEntity> books;
  final bool hasReachedEnd;

  NewsetBooksSuccess(this.books, {this.hasReachedEnd = false});
}

final class NewsetBooksFailure extends NewsetBooksState {
  final String errMassage;

  NewsetBooksFailure(this.errMassage);
}

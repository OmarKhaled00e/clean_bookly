import 'package:bookly/Features/home/domain/entites/book_entity.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {
  final List<BookEntity> oldBooks;
  FeaturedBooksPaginationLoading(this.oldBooks);
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;
  final bool hasReachedEnd;
  FeaturedBooksSuccess(this.books, {this.hasReachedEnd = false});
}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String message;
  FeaturedBooksFailure(this.message);
}

class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String message;
  final List<BookEntity> oldBooks;
  FeaturedBooksPaginationFailure(this.message, this.oldBooks);
}

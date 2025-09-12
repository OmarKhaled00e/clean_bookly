import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/search/domain/repos/search_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_cases.dart';
import 'package:dartz/dartz.dart';

class SearchBookUseCases extends UseCases<List<BookEntity>, String> {
  final SearchRepo searchRepo;

  SearchBookUseCases(this.searchRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([
    String? query,
    pageNumber = 0,
  ]) {
    return searchRepo.searchBooks(query: query ?? '', pageNumber: pageNumber);
  }
}

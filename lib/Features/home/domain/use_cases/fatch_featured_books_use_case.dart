import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_cases.dart';

import 'package:dartz/dartz.dart';




class FatchFeaturedBooksUseCase extends UseCases<List<BookEntity>, int>{
  final HomeRepo homeRepo;

  FatchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) async {
    return await homeRepo.fetchFeaturedBooks(
      pageNumber: pageNumber,
    );
  }
}

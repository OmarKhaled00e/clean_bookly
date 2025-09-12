import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly/Features/search/domain/repos/search_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required String query,
    int pageNumber = 0,
  }) async {
    try {
      final books = await searchRemoteDataSource.searchBooks(
        query: query,
        pageNumber: pageNumber,
      );
      return Right(books); // هنا books عبارة عن List<BookEntity>
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}

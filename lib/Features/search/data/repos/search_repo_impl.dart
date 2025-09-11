import 'package:bookly/Features/home/data/models/book_model/item.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/search/domain/repos/search_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required String query,
  }) async {
    try {
      final data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebook&q=$query",
      );
      List<BookEntity> books = getBooksList(data);
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
  if (data['items'] == null) return [];
  return (data['items'] as List)
      .map((item) => Item.fromJson(item))
      .toList();
}
}

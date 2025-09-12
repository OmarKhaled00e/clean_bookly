import 'package:bookly/Features/home/data/models/book_model/item.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';

import 'package:bookly/core/utils/api_service.dart';


abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchBooks({
    required String query,
    int pageNumber = 0,
  });
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> searchBooks({
    required String query,
    int pageNumber = 0,
  }) async {
    final data = await apiService.get(
      endPoint:
          "volumes?Filtering=free-ebook&q=$query&startIndex=${pageNumber * 10}&maxResults=10",
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  if (data['items'] == null) return [];
  return (data['items'] as List).map((item) => Item.fromJson(item)).toList();
}

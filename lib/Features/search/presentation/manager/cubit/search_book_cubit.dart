import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/search/domain/use_cases/search_book_use_cases.dart';
import 'package:meta/meta.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchBookUseCases) : super(SearchBookInitial());
  final SearchBookUseCases searchBookUseCases;

  Future<void> searchBooks(String query) async {
    emit(SearchBookLoading());
    final result = await searchBookUseCases.call(query);
    result.fold(
      (failure) => emit(SearchBookFailure(failure.errMassage)),
      (books) => emit(SearchBookSuccess(books)),
    );
  }
}

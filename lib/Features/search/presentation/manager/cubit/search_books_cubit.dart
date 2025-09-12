import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/search/domain/use_cases/search_book_use_cases.dart';
import 'package:meta/meta.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchBookUseCases) : super(SearchBooksInitial());
  final SearchBookUseCases searchBookUseCases;

  final List<BookEntity> _allBooks = [];
  int _page = 0;
  bool _hasReachedEnd = false;
  bool _isLoading = false;
  String _lastQuery = '';
  

  Future<void> searchBooks(String query) async {
    if (_isLoading) return;
    _lastQuery = query;
    _page = 0;
    _hasReachedEnd = false;
    _allBooks.clear();
    await _fetchPage();
  }

  Future<void> loadMore() async {
    if (_isLoading || _hasReachedEnd) return;
    await _fetchPage();
  }

  Future<void> _fetchPage() async {
    if (_isLoading) return;
    _isLoading = true;

    // الحالة الحالية: لو الصفحة الأولى
    if (_page == 0) {
      emit(SearchBooksLoading());
    } else {
      // Pagination Loading: مع الاحتفاظ بالكتب القديمة
      emit(SearchBooksPaginationLoading(List.from(_allBooks)));
    }

    final result = await searchBookUseCases.call(_lastQuery, _page);

    result.fold(
      (failure) {
        if (_page == 0) {
          emit(SearchBooksFailure(failure.errMassage));
        } else {
          emit(
            SearchBooksPaginationFailure(
              failure.errMassage,
              List.from(_allBooks),
            ),
          );
        }
      },
      (books) {
        if (books.isEmpty) {
          _hasReachedEnd = true;
        } else {
          _allBooks.addAll(books);
          _page++;
        }
        // نرسل دائمًا كل الكتب الحالية مع hasMore
        emit(
          SearchBooksSuccess(
            List.from(_allBooks),
            hasReachedEnd: !_hasReachedEnd,
          ),
        );
      },
    );

    _isLoading = false;
  }
}

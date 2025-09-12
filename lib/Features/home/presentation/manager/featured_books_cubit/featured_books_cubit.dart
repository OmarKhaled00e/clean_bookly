import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fatch_featured_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';




class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fatchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());

  final FatchFeaturedBooksUseCase fatchFeaturedBooksUseCase;

  final List<BookEntity> _allBooks = [];
  int _page = 0;
  bool _hasReachedEnd = false;
  bool _isLoadingMore = false;

  Future<void> fetchFeaturedBooks() async {
    if (_isLoadingMore || _hasReachedEnd) return;

    if (_page == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading(List.from(_allBooks)));
    }

    _isLoadingMore = true;

    final result = await fatchFeaturedBooksUseCase.call(_page);

    result.fold(
      (failure) {
        if (_page == 0) {
          emit(FeaturedBooksFailure(failure.errMassage));
        } else {
          emit(FeaturedBooksPaginationFailure(
              failure.errMassage, List.from(_allBooks)));
        }
      },
      (books) {
        if (books.isEmpty) {
          _hasReachedEnd = true;
        } else {
          _allBooks.addAll(books);
          _page++;
        }

        emit(FeaturedBooksSuccess(List.from(_allBooks),
            hasReachedEnd: _hasReachedEnd));
      },
    );

    _isLoadingMore = false;
  }
}

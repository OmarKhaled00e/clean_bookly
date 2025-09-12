import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fatch_newset_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fatchNewsetBooksUseCase)
      : super(NewsetBooksInitial());

  final FatchNewsetBooksUseCase fatchNewsetBooksUseCase;

  final List<BookEntity> _allBooks = [];
  int _page = 0;
  bool _hasReachedEnd = false;
  bool _isLoadingMore = false;

  Future<void> fetchNewsetBooks() async {
    if (_isLoadingMore || _hasReachedEnd) return;

    if (_page == 0) {
      emit(NewsetBooksLoading());
    } else {
      emit(NewsetBooksPaginationLoading(List.from(_allBooks)));
    }

    _isLoadingMore = true;

    final result = await fatchNewsetBooksUseCase.call(_page);

    result.fold(
      (failure) {
        if (_page == 0) {
          emit(NewsetBooksFailure(failure.errMassage));
        } else {
          emit(NewsetBooksPaginationFailure(
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

        emit(NewsetBooksSuccess(List.from(_allBooks),
            hasReachedEnd: _hasReachedEnd));
      },
    );

    _isLoadingMore = false;
  }
}

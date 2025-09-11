import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fatch_newset_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fatchNewsetBooksUseCase) : super(NewsetBooksInitial());
  final FatchNewsetBooksUseCase fatchNewsetBooksUseCase;
  Future<void> fetchNewsetBook({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewsetBooksLoading());
    } else {
      emit(NewsetBooksPaginationLoading());
    }

    var result = await fatchNewsetBooksUseCase.call(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(NewsetBooksFailure(failure.errMassage));
        } else {
          emit(NewsetBooksPaginationFailure(failure.errMassage));
        }
      },
      (books) {
        emit(NewsetBooksSuccess(books));
      },
    );
  }
}

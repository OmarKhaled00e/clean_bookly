import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fatch_newset_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fatchNewsetBooksUseCase) : super(NewsetBooksInitial());
  final FatchNewsetBooksUseCase fatchNewsetBooksUseCase;
  Future<void> fetchNewsetBook() async {
    emit(NewsetBooksLoading());

    var result = await fatchNewsetBooksUseCase.call()

    result.fold(
      (failure) {
        emit(NewsetBooksFailure(failure.errMassage));
      },
      (books) {
        emit(NewsetBooksSuccess(books));
      },
    );
  }
}

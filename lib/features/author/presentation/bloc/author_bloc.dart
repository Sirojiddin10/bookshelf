import 'package:bloc/bloc.dart';
import 'package:bookshelf/assets/enums.dart';
import 'package:bookshelf/features/author/domain/entities/author_entity.dart';
import 'package:bookshelf/features/author/domain/usecases/fetch_authors_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'author_event.dart';
part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  final FetchAuthorsUseCase fetchAuthorsUseCase;

  AuthorBloc({required this.fetchAuthorsUseCase}) : super(AuthorState()) {
    on<GetAuthorsEvent>(
      _onGetAuthorsEvent,
      transformer: (events, mapper) => events.debounceTime(Duration(milliseconds: 300)).switchMap(mapper),
    );
  }

  Future<void> _onGetAuthorsEvent(GetAuthorsEvent event, Emitter<AuthorState> emit) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(authors: [], resultCount: 0, authorsStatus: FormStatus.pure));
      return;
    } else if (event.query.length > 3) {
      emit(state.copyWith(authorsStatus: FormStatus.loading));
      final result = await fetchAuthorsUseCase(event.query);
      result.either(
        (failure) {
          emit(state.copyWith(authorsStatus: FormStatus.error));
        },
        (data) {
          emit(
            state.copyWith(
              resultCount: data.resultCount.toInt(),
              authors: data.results,
              authorsStatus: FormStatus.success,
            ),
          );
        },
      );
    }
  }
}

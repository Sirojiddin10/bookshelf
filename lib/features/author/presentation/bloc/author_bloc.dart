import 'package:bloc/bloc.dart';
import 'package:bookshelf/assets/enums.dart';
import 'package:bookshelf/features/author/domain/entities/author_detail_entity.dart';
import 'package:bookshelf/features/author/domain/entities/author_entity.dart';
import 'package:bookshelf/features/author/domain/entities/author_work_entity.dart';
import 'package:bookshelf/features/author/domain/usecases/fetch_authors_usecase.dart';
import 'package:bookshelf/features/author/domain/usecases/get_author_detail_usecase.dart';
import 'package:bookshelf/features/author/domain/usecases/get_author_works_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'author_event.dart';
part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  final GetAuthorsUseCase fetchAuthorsUseCase;
  final GetAuthorDetailUseCase getAuthorDetailUseCase;
  final GetAuthorWorksUseCase getAuthorWorksUseCase;

  AuthorBloc({
    required this.fetchAuthorsUseCase,
    required this.getAuthorWorksUseCase,
    required this.getAuthorDetailUseCase,
  }) : super(AuthorState()) {
    on<GetAuthorsEvent>(
      _onGetAuthorsEvent,
      transformer: (events, mapper) => events.debounceTime(Duration(milliseconds: 300)).switchMap(mapper),
    );
    on<GetAuthorDetailsEvent>(_onGetAuthorDetailsEvent);
    on<GetAuthorWorksEvent>(_onGetAuthorWorksEvent);
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

  Future<void> _onGetAuthorDetailsEvent(GetAuthorDetailsEvent event, Emitter<AuthorState> emit) async {
    emit(state.copyWith(authorDetailStatus: FormStatus.loading));
    final result = await getAuthorDetailUseCase(event.authorId);
    result.either(
      (failure) {
        emit(state.copyWith(authorDetailStatus: FormStatus.error));
      },
      (data) {
        emit(state.copyWith(authorDetail: data, authorDetailStatus: FormStatus.success));
      },
    );
  }

  Future<void> _onGetAuthorWorksEvent(GetAuthorWorksEvent event, Emitter<AuthorState> emit) async {
    if (event.nextLink == null || (event.nextLink?.isEmpty ?? false)) {
      emit(state.copyWith(authorWorkStatus: FormStatus.loading));
    }
    final result = await getAuthorWorksUseCase(GetAuthorWorksParams(authorId: event.authorId, next: event.nextLink));
    result.either(
      (failure) {
        emit(state.copyWith(authorWorkStatus: FormStatus.error));
      },
      (data) {
        emit(
          state.copyWith(
            authorWorks: [...state.authorWorks, ...data.entries],
            authorWorkStatus: FormStatus.success,
            authorWorksNextLink: data.links.next,
          ),
        );
      },
    );
  }
}

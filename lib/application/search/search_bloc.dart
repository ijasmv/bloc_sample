import 'package:bloc_sample/domain/downloads/i_downloads_repo.dart';
import 'package:bloc_sample/domain/downloads/models/downloads.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/search/i_search_repo.dart';
import '../../domain/search/models/search_resp/search_resp.dart';
part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsRepo;
  final ISearchRepo _searchRepo;
  SearchBloc(
    this._downloadsRepo,
    this._searchRepo,
  ) : super(SearchState.initial()) {
    /* 
      idle state
    */
    on<Initialize>((event, emit) async {
      emit(const SearchState(
        result: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      final result = await _downloadsRepo.getDownloadImages();
      final newState = result.fold((failure) {
        return const SearchState(
          result: [],
          idleList: [],
          isLoading: false,
          isError: true,
        );
      }, (success) {
        return SearchState(
          result: [],
          idleList: success,
          isLoading: false,
          isError: false,
        );
      });
      emit(newState);
    });

    /* 
      search movie
    */
    on<SearchMovie>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await _searchRepo.searchMovies(query: event.query);
      result.fold((failure) {
        emit(state.copyWith(
          result: [],
          isLoading: false,
          isError: true,
        ));
      }, (success) {
        emit(state.copyWith(
          result: success.results!,
          isLoading: false,
          isError: false,
        ));
      });
    });
  }
}

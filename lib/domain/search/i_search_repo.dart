import 'package:bloc_sample/domain/core/failures/main_failure.dart';
import 'package:bloc_sample/domain/search/models/search_resp/search_resp.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchRepo {
  Future<Either<MainFailure, SearchResp>> searchMovies({
    required String query,
  });
}

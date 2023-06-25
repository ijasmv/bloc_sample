// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_sample/application/downloads/downloads_bloc.dart' as _i8;
import 'package:bloc_sample/application/search/search_bloc.dart' as _i7;
import 'package:bloc_sample/domain/downloads/i_downloads_repo.dart' as _i3;
import 'package:bloc_sample/domain/search/i_search_repo.dart' as _i5;
import 'package:bloc_sample/infrastructure/downloads/downloads_repository.dart'
    as _i4;
import 'package:bloc_sample/infrastructure/search/search_repository.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IDownloadsRepo>(() => _i4.DownloadsRepository());
  gh.lazySingleton<_i5.ISearchRepo>(() => _i6.SearchRepository());
  gh.factory<_i7.SearchBloc>(() => _i7.SearchBloc(
        gh<_i3.IDownloadsRepo>(),
        gh<_i5.ISearchRepo>(),
      ));
  gh.factory<_i8.DownloadsBloc>(
      () => _i8.DownloadsBloc(gh<_i3.IDownloadsRepo>()));
  return getIt;
}

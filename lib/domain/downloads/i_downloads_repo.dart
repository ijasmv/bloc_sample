import 'package:bloc_sample/domain/core/failures/main_failure.dart';
import 'package:bloc_sample/domain/downloads/models/downloads.dart';
import 'package:dartz/dartz.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadImages();
}

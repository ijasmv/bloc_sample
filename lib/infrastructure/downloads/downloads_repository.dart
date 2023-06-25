import 'dart:developer';

import 'package:bloc_sample/domain/core/api_end_points.dart';
import 'package:bloc_sample/domain/core/failures/main_failure.dart';
import 'package:bloc_sample/domain/downloads/i_downloads_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc_sample/domain/downloads/models/downloads.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList =
            (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        log(downloadsList.toString());
        // for (var raw in response.data) {
        //   downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        // }
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}

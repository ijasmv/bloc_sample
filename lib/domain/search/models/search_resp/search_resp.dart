import 'package:bloc_sample/core/constants.dart';
import 'package:bloc_sample/domain/core/api_end_points.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_resp.g.dart';

@JsonSerializable()
class SearchResp {
  int? page;
  // @JsonKey(name: 'results')
  List<SearchResultData>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  SearchResp({this.page, this.results, this.totalPages, this.totalResults});

  factory SearchResp.fromJson(Map<String, dynamic> json) {
    return _$SearchRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRespToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  SearchResultData({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}

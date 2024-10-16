import 'dart:convert';

import 'package:cinemapedia/infrastructure/models/movieDB/movie_moviedb.dart';

MovieDBResponse movieDbResponseFromJson(String str) => MovieDBResponse.fromJson(json.decode(str));

String movieDbResponseToJson(MovieDBResponse data) => json.encode(data.toJson());

class MovieDBResponse {
    Dates? dates;
    int page;
    List<MovieMovieDB> results;
    int totalPages;
    int totalResults;

    MovieDBResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory MovieDBResponse.fromJson(Map<String, dynamic> json) => MovieDBResponse(
        dates: json["dates"] != null ? Dates.fromJson(json['dates']) : null,
        page: json["page"],
        results: List<MovieMovieDB>.from(json["results"].map((x) => MovieMovieDB.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "dates":dates?.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Dates {
    DateTime maximum;
    DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}


import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  // Todo Repo, Data source

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
        .toList();

        videos.addAll(newVideos);

    initialLoading = false;

    notifyListeners();
  }
}

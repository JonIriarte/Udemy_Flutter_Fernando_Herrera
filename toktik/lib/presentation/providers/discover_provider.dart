import 'package:flutter/material.dart';
import 'package:toktik/data/repositories/video_post_respository.dart';
import 'package:toktik/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRespositoryImpl videoPostRespository;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRespository});

  // Todo Repo, Data source

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    // List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videoPostRespository.getVideoPostsByPage(1);

    videos.addAll(newVideos);

    initialLoading = false;

    notifyListeners();
  }
}

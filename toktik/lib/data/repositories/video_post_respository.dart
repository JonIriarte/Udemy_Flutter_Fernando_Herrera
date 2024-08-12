import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostRespositoryImpl implements VideoPostsRepository {
  final VideoPostsDatasource videoPostsDatasource;

  VideoPostRespositoryImpl({required this.videoPostsDatasource});

  @override
  Future<List<VideoPost>> getFavouriteVideoPostsByUserId(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getVideoPostsByPage(int page) {
    return videoPostsDatasource.getVideoPostsByPage(page);
  }
}

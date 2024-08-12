import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostsDatasource {
  Future<List<VideoPost>> getVideoPostsByPage(int page );

  Future<List<VideoPost>> getFavouriteVideoPostsByUserId(String userId);
}
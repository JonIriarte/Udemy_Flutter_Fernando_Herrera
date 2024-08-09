import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        Container(color: Colors.red[100]),
        Container(color: Colors.green[100]),
        Container(color: Colors.deepPurple[100]), 
         Container(color: Colors.deepPurpleAccent[400])
  
      ],
    );
  }
}

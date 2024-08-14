import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  const VideoButtons({super.key, required this.video});

  final VideoPost video;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _CustomIconButton(
          value: video.likes, icon: Icons.favorite, iconColor: Colors.red),
      const SizedBox(
        height: 15,
      ),
      _CustomIconButton(
          value: video.likes,
          icon: Icons.remove_red_eye_outlined,
          iconColor: null),
      const SizedBox(
        height: 15,
      ),
      SpinPerfect(
          duration: const Duration(seconds: 3),
          child: const _CustomIconButton(
              value: 0, icon: Icons.play_circle_outline))
    ]);
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({required this.value, required this.icon, iconColor})
      : color = iconColor ?? Colors.white;

  final int value;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
          onPressed: onPressedLike, icon: Icon(icon, color: color, size: 29)),
      value > 0
          ? Text(HumanFormats.humanReadableNumber(value.toDouble()))
          : const Text('')
    ]);
  }

  void onPressedLike() {
    
  }
}

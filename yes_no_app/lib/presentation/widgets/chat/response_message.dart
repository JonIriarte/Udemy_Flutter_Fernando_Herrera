
import 'package:flutter/material.dart';

class ResponseMessageBubble extends StatelessWidget {
  const ResponseMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(.0, 0.0, 100.0, 0.0),
          padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: const Text(
            'Respondo a tu pregunta',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Text(
          DateTime.now().toString(),
          style: const TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 5.0),
        //Todo: image
        _ImageBubble(),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
          'https://yesno.wtf/assets/yes/11-a23cbde4ae018bbda812d2d8b2b8fc6c.gif', width: size.width * 0.5, height: 150, fit: BoxFit.cover),
          
    );
  }
}

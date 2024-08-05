import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  

  @override
  Widget build(BuildContext context) {

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk:mm:ss').format(now);
  



    return  Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 0.0),
          padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: const Text(
            'Hola, ¿cómo estás?',
            style: TextStyle(color: Colors.white),
          ),
        ),
         Text(
          formattedDate,
          style: const TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 10.0),
      ],
    );
  }
}
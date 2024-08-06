import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';


class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key, required this.message});

  
  final Message message;
 

  @override
  Widget build(BuildContext context) {


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
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
         Text(
           message.messageTime,
          style: const TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 7.0),
      ],
    );
  }
}
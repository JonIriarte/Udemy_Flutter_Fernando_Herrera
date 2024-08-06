import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:yes_no_app/domain/entities/message.dart";
import "package:yes_no_app/presentation/providers/chat_provider.dart";
import "package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart";
import "package:yes_no_app/presentation/widgets/chat/response_message.dart";
import "package:yes_no_app/presentation/widgets/sharedWidgets/message_field_box.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mi chat '),
          leading: IconButton(
            icon: const Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i2-prod.themirror.com/incoming/article615451.ece/ALTERNATES/s1200d/0_MAIN-OLY_.jpg'),
              ),
            ),
            onPressed: onPressed,
          ),
          centerTitle: false,
        ),
        body: const _ChatView());
  }

  void onPressed() {}
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SafeArea(
          child: Column(children: [
        Expanded(
            child: ListView.builder(
              controller: chatProvider.chatScrollController,
          itemCount: chatProvider.messageList.length,
          itemBuilder: (context, index) {
            final message = chatProvider.messageList[index];
            return (message.fromWho == FromWho.fromMe)
                ? MyMessageBubble(message: message)
                :  ResponseMessageBubble(message:message);
          },
        )),
        MessageFieldBox(
          onValue: chatProvider.sendMessage,
        ),
      ])),
    );
  }
}

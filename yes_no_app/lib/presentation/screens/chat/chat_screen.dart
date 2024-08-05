import "package:flutter/material.dart";

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

  void onPressed() {
    print(' onPressed \n');
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SafeArea(
          child: Column(children: [
        Expanded(child: ListView.builder( itemCount: 100, itemBuilder: (context, index) {
          return Text('INDEX: $index');
        },)),
        const Text('  MUNDO ')
      ])),
    );
  }
}

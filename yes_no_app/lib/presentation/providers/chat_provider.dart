import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  final List<Message> messageList = [
    // Message(
    //     text: 'Hola, ¿cómo estás?',
    //     fromWho: FromWho.fromMe,
    //     time: DateTime.now()),
    // Message(
    //     text: '¿Has? vuelto ya',
    //     fromWho: FromWho.fromOther,
    //     time: DateTime.now()),
  ];

  Future<void> responseReply() async {
    final responseMessage = await getYesNoAnswer.getAnswer();
    messageList.add(responseMessage);
    notifyListeners();
    _moveScrollToBottom();
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newNessage =
        Message(text: text, fromWho: FromWho.fromMe, time: DateTime.now());

    messageList.add(newNessage);

    RegExp regExp = RegExp(r'\?$');

    if (regExp.hasMatch(text)) {
      await responseReply();
    }

    notifyListeners();
    _moveScrollToBottom();
  }

  Future<void> _moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

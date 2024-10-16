import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key, required this.onValue});

  final ValueChanged<String> onValue;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    const outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(0.0),
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      borderSide: BorderSide(color: Colors.transparent),
    );

    final inputDecoration = InputDecoration(
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      hintText: '...',
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_rounded),
        onPressed: () {
          textController.clear();
        },
      ),
    );

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}

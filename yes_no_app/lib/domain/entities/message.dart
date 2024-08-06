enum FromWho { fromMe, fromOther }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime time;

  Message(
      {required this.text,
      this.imageUrl,
      required this.fromWho,
      required this.time});

  get messageTime {
    return '${time.hour}:${time.minute}:${time.second}';
  }
}

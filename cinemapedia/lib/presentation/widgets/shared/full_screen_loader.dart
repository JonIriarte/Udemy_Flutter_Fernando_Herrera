import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  FullScreenLoader({super.key});

  final messages = <String>[
    'Cargaaaaaaando...',
    'Cargaaaaaaaaaaaaaaaaaaando...',
    'Parece que esto va a su ritmo y está de lunes...',
    'Ve a preparar palomitas',
    '¿Has mirado  si tu gato tiene comida?',
    'Vooooooy....',
    '42',
    'Cargando populares'
  ];

  Stream<String> getLoadingMessages() {
    return Stream.periodic(const Duration(milliseconds: 15000), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Wait...'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
              stream: getLoadingMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Cargando');
                return Text(snapshot.data!);
              })
        ],
      ),
    );
  }
}

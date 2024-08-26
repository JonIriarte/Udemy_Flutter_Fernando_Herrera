import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  static const routeName = 'snackbar_screen';

  @override
  Widget build(BuildContext context) {
    void showCustomSnackbar(BuildContext context) {
      ScaffoldMessenger.of(context).clearSnackBars();
      var snackBar = SnackBar(
        content: const Text('Hello, Snackbar'),
        action: SnackBarAction(label: 'OK', onPressed: () {}),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void openDialogue(BuildContext context) {
      const titleDialogue = (' LOREM IPSUM 42');
      const textDialogue =
          ('To summarize: it is a well-known fact that those people who must want to rule people are, ipso facto, those least suited to do it. To summarize the summary: anyone who is capable of getting themselves made President should on no account be allowed to do the job. To summarize the summary of the summary: people are a problem. Why are people born? Why do they die? Why do they want to spend so much of the intervening time wearing digital watches? It was a dreamworld, if the dreamers were testosterone-fueled males who were never forced to behave like adults.');
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                title: const Text(titleDialogue),
                content: const Text(textDialogue),
                actions: [
                  TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('Cancelar')),
                  FilledButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Aceptar'))
                ],
              ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack bars and dialogues'),
        leading: IconButton(
            onPressed: () => GoRouter.of(context).go(HomeScreen.routeName),
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                  context: context, children: [const Text('Lorem 42 ipsum')]);
            },
            child: const Text('Licencias usadas')),
        FilledButton.tonal(
            onPressed: () => openDialogue(context),
            child: const Text('Mostrar diálogo de pantalla'))
      ])),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showCustomSnackbar(context),
          icon: const Icon(Icons.remove_red_eye_outlined),
          label: const Text('Mostrar Snackbar')),
    );
  }
}

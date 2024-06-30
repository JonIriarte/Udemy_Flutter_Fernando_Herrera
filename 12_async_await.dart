void main() async {
  print('Inicio del programa');
  try {
    final value = await httpGet('web_de_ejemplo.com');
    print(value);
  } catch (err) {
    print('ERROR: $err');
  }

  print('fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));
//   return 'Respuesta de la petición http';
  throw 'Error en la petición http';
}

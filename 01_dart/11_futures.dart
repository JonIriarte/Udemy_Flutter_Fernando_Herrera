void main() {
  print('Inicio del programa');
  httpGet('http://json.com')
      .then((value) => {print(value)})
      .catchError((err) => {print('ERROR: $err')});

  print('fin del programa');
}

Future<String> httpGet(String url) {
  return Future.delayed(const Duration(seconds: 1), () {
    throw 'Error en la petición http';
//     return 'Respuesta de la petición http';
  });
}

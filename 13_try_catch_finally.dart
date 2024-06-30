void main() async {
  print('Inicio del programa');
  try {
    final value = await httpGet('http://json.com');
    print(value);
  } on Exception catch (err) {
    print('Tenemos una Exception: $err');
  } catch (err) {
    print('ERROR: $err');
  } finally {
    print('fin del bloque try-catch');
  }
  print('fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  throw Exception('No hay parámetro en la URL');
  // return 'Respuesta de la petición http';
}

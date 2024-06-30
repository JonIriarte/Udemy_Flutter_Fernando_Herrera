void main() {
  final Map<String, dynamic> pokemon = {
    'name': 'Ditto',
    'hp': 100,
    'isAlive': true,
    'abilities': <String>['impostor'],
    'sprites': {1: 'ditto/front.png', 2: 'ditto/back.png'}
  };

  print(pokemon);
  print('sprites: ${pokemon['sprites']}');
  print('sprites front : ${pokemon['sprites'][1]}');
  print('sprites back : ${pokemon['sprites'][2]}');
}

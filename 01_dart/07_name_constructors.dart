void main() {
  

  final Map<String, dynamic> rawJson = {
    'isAlive': true,
    'power': 'Money',
    'name': 'Batman'
  };
  final batman = Hero.fromJson(rawJson);
  print (batman);
}



class Hero {
  String name;
  String power;
  bool isAlive;



  Hero.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? ' no name found',
        power = json['power'] ?? ' no power found',
        isAlive = json['isAlive'] ?? false;

  @override
  toString() {
    return '$name - $power - isAlive: ${isAlive ? 'YES' : 'No... :( '}';
  }
}

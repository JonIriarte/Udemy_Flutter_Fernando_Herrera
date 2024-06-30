void main() {
  // final wolverine = Hero('Logan', 'Regeneración');

  // print(wolverine);
  // print(wolverine.name);
  /**
    Esto va con el ejemplo de abajo
   */
//   final wolverine2 = Hero(name: 'Logan');

//  print(wolverine2);
  final vulkan = Hero( power: 'Perpetual', name: 'Vulkan');
  print(vulkan);
}

/**
Inicialización rápida
*/
class Hero {
  String name;
  String power;

  // Hero(this.name, this.power);

  /** 
  Inicialización más lenta y controlada
  */
  // Hero(String pName, String pPower)
  //     : name = pName,
  //       power = pPower;

  //  Hero({ required this.name,  required this.power});

  /**
     Ejemplo de abajo. Se inicializa una propiedad desde aquí en ve de por parámetro
      */

  //  Hero({ required this.name, this.power= 'Sin poder'});

//   Hero( String pName, String pPower)
//     :name = pName,
//     power = pPower;
Hero({required this.name, required this.power}); 
  /**
    Se sobreescribe un método
   */
  @override
  toString() {
    return '$name - $power';
  }
}

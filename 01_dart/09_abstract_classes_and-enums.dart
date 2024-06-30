void main() {
  final windplant = WindPlant(initialEnergy: 100);
  final nucelarPlant = NuclearPlant(energyLeft: 15000);

  print('wind: ${chargePhone(windplant)}');
  print('nucelar: ${chargePhone(nucelarPlant)}');
}

double chargePhone(EnergyPlant plant) {
  if (plant.energyLeft < 10) {
    throw Exception('not enough energy: ${plant.energyLeft}');
  }
  return plant.energyLeft - 10;
}

enum PlantType { nuclear, wind, water }

abstract class EnergyPlant {
  double energyLeft;
 final PlantType type;

  EnergyPlant({required this.energyLeft, required this.type});
  void consumeEnergy(double amount) {
    throw UnimplementedError();
  }
}

//extends o implements
class WindPlant extends EnergyPlant {
  WindPlant({required double initialEnergy})
      : super(energyLeft: initialEnergy, type: PlantType.wind);

  @override
  void consumeEnergy(double amount) {
    energyLeft -= amount;
  }
}

class NuclearPlant implements EnergyPlant {
  @override
  double energyLeft;
  
  @override
  PlantType type = PlantType.nuclear;
  NuclearPlant({required this.energyLeft});

  @override
  void consumeEnergy(double amount) {
    energyLeft -= (amount * 0.5);
  }
}

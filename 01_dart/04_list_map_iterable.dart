void main() {
  final numbers = [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9, 12];

  print('List original ${numbers}');
  print('List original length ${numbers.length}');
  print('List original  ${numbers[3]}');
  print('List original  ${numbers.first}');
  print('List original  ${numbers.reversed}');
  print('List original  ${numbers.hashCode}');

  final reversedNumbers = numbers.reversed;
  print('Iterable List ${reversedNumbers.toList()}');
  print('Iterable set ${reversedNumbers.toSet()}');
  final numbersGreaterThan5 = numbers.where((num) {
    return num > 5;
  });
  print(' Iterable >5: ${numbersGreaterThan5}');
  print(' Set >5: ${numbersGreaterThan5.toSet()}');
}

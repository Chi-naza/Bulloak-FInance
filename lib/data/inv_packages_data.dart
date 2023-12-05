import 'dart:math';

List<dynamic> packages = [
  {
    'name': 'Forest',
    'image': 'assets/packages/forex.png',
  },
  {
    'name': 'Real Estate',
    'image': 'assets/packages/realestate.png',
  },
  {
    'name': 'Wing',
    'image': 'assets/packages/wing.png',
  },
  {
    'name': 'Crypto',
    'image': 'assets/packages/crypto.png',
  },
  {
    'name': 'Cannabis',
    'image': 'assets/packages/cannabis.png',
  },
];

int generateRandomPackages() {
  Random random = new Random();
  int randomNumber = random.nextInt(5);
  print("TESTING Random: $randomNumber");
  return randomNumber;
}

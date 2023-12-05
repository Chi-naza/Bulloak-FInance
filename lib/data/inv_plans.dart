import 'dart:math';

List<dynamic> plans = [
  {
    'image': 'assets/plans/standardrect.png',
    'topbar': 'assets/plans/standard.png',
    'ROI': '7% ROI',
    'name': 'standard plan',
    'button': 'assets/plans/standardbtn.png',
    'min': '\$1000',
    'max': '\$10000'
  },
  {
    'image': 'assets/plans/premiumrect.png',
    'topbar': 'assets/plans/premium.png',
    'ROI': '10% ROI',
    'name': 'premium',
    'button': 'assets/plans/premiumbtn.png',
    'min': '\$10000',
    'max': '\$50000'
  },
  {
    'image': 'assets/plans/hedgerect.png',
    'topbar': 'assets/plans/hedge.png',
    'ROI': '15% ROI',
    'button': 'assets/plans/hedgebtn.png',
    'name': 'hedge investor',
    'min': '\$50000',
    'max': '\$200000'
  },
  {
    'image': 'assets/plans/hedgerect.png',
    'topbar': 'assets/plans/sky.png',
    'ROI': '20% ROI',
    'name': 'Sky investor',
    'button': 'assets/plans/skybtn.png',
    'min': '\$200000',
    'max': '\$1000000'
  },
  {
    'image': 'assets/plans/starrect.png',
    'topbar': 'assets/plans/star.png',
    'ROI': '20% ROI',
    'name': 'Star investor',
    'button': 'assets/plans/starbtn.png',
    'min': '\$1000000',
    'max': '\$10000000'
  },
];

int generateRandomIndex() {
  Random random = new Random();
  int randomNumber = random.nextInt(5);
  print("TESTING Random: $randomNumber");
  return randomNumber;
}

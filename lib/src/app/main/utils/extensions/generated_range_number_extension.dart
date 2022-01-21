import 'dart:math';

extension Numbers on int {
  static int generate({required int min, required int max}) =>
      min + Random().nextInt(max - min);
}

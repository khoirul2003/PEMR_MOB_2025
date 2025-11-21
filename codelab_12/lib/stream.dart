import 'dart:math';
import 'dart:async';

class NumberStream {
  // Langkah 3: Method getNumbers() yang menghasilkan Stream angka acak setiap detik
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      // Menghasilkan angka acak antara 0 hingga 9
      int myNum = random.nextInt(10);
      return myNum;
    });
  }
}

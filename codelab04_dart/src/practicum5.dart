void main() {
   var angka = (10, 20);
  print('Sebelum tukar: $angka');
  var hasil = tukar(angka);
  print('Sesudah tukar: $hasil');

  (String, int) mahasiswa = ('Khoirul', 244107023007);
  print(mahasiswa);

  var mahasiswa2 = ('Khoirul', a: 244107023007, b: true, 'Anwarudin');

  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2);
}

(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {
  var gifts = {'first': 'partridge', 'second': 'turtledoves', 'fifth': 1};

  var nobleGases = {2: 'helium', 10: 'neon', 18: 2};

  var mhs1 = Map<String, String>();
  var mhs2 = Map<int, String>();

  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  gifts['name'] = 'Muhammad Khoirul Anwarudin';
  gifts['nim'] = '244107023007';

  nobleGases[99] = 'extraGas';

  mhs1['name'] = 'Muhammad Khoirul Anwarudin';
  mhs1['nim'] = '244107023007';

  mhs2[1] = 'Muhammad Khoirul Anwarudin';
  mhs2[2] = '244107023007';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}

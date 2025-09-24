void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{}; // Explicit Set<String>
  Set<String> names2 = {};
  var names3 = {};

  names1.add("Khoirul");
  names1.add("Anwar");

  names2.addAll({"Budi", "20230123"});

  names3["name"] = "Sinta";
  names3["nim"] = "20231234";

  print(names1);
  print(names2);
  print(names3);
}
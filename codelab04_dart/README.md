# Dart Practical Assignment

## Practice 1: Experiment Type Data List

**Step 1**

**Click or copy the code in the following programs void main().**
```dart
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);
```

**Step 2:**

**Then try executing (Run) the code in step 1 above. What happened? Clear out!**

**assert does not return an error because all conditions are true. The output that appears in the console is:**

![alt text](img/image1.png)

**Step 3**

**In this code step 1 becomes variable final which has index = 5 with default value = null. Same name as NIM and added elements of index 1 and 2. Then print and capture the result.**

**What happened? If error occurs, please correct.**

![alt text](img/image2.png)

**index 0 = null**
**index 1 = 244107023007**
**index 2 = MUHAMMAD Khoirul Anwarudin**
**index 3 = null**
**index 4 = null**

## Practice 2: Experiment Type Data Set

**Complete the step-by-step tutorial below using VS Code or your favorite Code Editor.**

**Langkah 1:**
**Click or type the code in the following functions main().**
```dart
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
print(halogens);
```

**Langkah 2:**
**Then try executing (Run) the code in step 1 above. What happened? Clear out! Then wait if error occurs.**

**Langkah 3:**
**Add the following code to the program, then try executing (Run) the following code.**
```dart
var names1 = <String>{};
Set<String> names2 = {}; // This works, too.
var names3 = {}; // Creates a map, not a set.
```

**print(names1);**
**print(names2);**
**print(names3);**
**What happened? If an error occurs, please correct it but still use the third variable. Add element name and NIM and give both variable sets with two different functions .add(). .addAll()To delete the variable Map, we will try this practical next.**

**Document the code and results in the console, then create a report.**


## Practice 3: Experiment Type Data Maps
**Complete the step-by-step tutorial below using VS Code or your favorite Code Editor.**

**Langkah 1:**
**Click or type the code in the following functions main().**

```dart
var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 1
};

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 2,
};

print(gifts);
print(nobleGases);
```

**Langkah 2:**
**Then try executing (Run) the code in step 1 above. What happened? Clear out! Then wait if error occurs.**

**Langkah 3:**
**Add the following code to the program, then try executing (Run) the following code.**

```dart
var mhs1 = Map<String, String>();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var mhs2 = Map<int, String>();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';
```

**What happened? If error occurs, please correct.**

**Add element name and NIM and add each variable above ( gifts, nobleGases, mhs1, and mhs2). Document results and create reports!**


## Practice 4: Experiment Type Data List: Spread and Control-flow Operators
**Complete the step-by-step tutorial below using VS Code or your favorite Code Editor.**

**Langkah 1:**
**Click or type the code in the following functions main().**

```dart
var list = [1, 2, 3];
var list2 = [0, ...list];
print(list1);
print(list2);
print(list2.length);
```

**Langkah 2:**
**Then try executing (Run) the code in step 1 above. What happened? Clear out! Then wait if error occurs.**

**Langkah 3:**
**Add the following code to the program, then try executing (Run) the following code.**

```dart
list1 = [1, 2, null];
print(list1);
var list3 = [0, ...?list1];
print(list3.length);
```

**What happened? If error occurs, please correct.**

**Add variable list containing NIM and use Spread Operators. Document results and create reports!**

**Langkah 4:**
**Add the following code to the program, then try executing (Run) the following code.**


```dart
var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
print(nav);
```

**What happened? If error occurs, please correct. Show result if variable promoActivewhen truegiven false.**

**Langkah 5:**
**Add the following code to the program, then try executing (Run) the following code.**


```dart
var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
print(nav2);
```

**What happened? If error occurs, please correct. Show results if the variable loginhas other conditions.**

**Langkah 6:**
**Add the following code to the program, then try executing (Run) the following code.**

```dart
var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
assert(listOfStrings[1] == '#1');
print(listOfStrings);
```

**What happened? If error occurs, please correct. Clear benefit collection for and documentation results.**


## Practice 5: Experiment Type Data Records
**Note: Type data records started introduced in Dart version 3.0. Make sure you are set up using Dart 3.0 or newer.**

**Complete the step-by-step tutorial below using VS Code or your favorite Code Editor.**

**Langkah 1:**
**Click or type the code in the following functions main().**

```dart
var record = ('first', a: 2, b: true, 'last');
print(record)
```

**Langkah 2:**
**Then try executing (Run) the code in step 1 above. What happened? Clear out! Then wait if error occurs.**

**Langkah 3:**
**Add the following code to the program outside the scope void main(), then try executing (Run) the next code.**

```dart
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
```

**What happened? If error occurs, please correct. Use the function tukar()inside main()to clearly see the process of changing value fields in records.**

**Langkah 4:**
**Add the following code program in the scope void main(), then try executing (Run) this code.**

```dart
// Record type annotation in a variable declaration:
(String, int) mahasiswa;
print(mahasiswa);
```

**What happened? If error occurs, please correct. Initialization fields name and NIM are given to the variable record mahasiswaabove. Document results and create reports!**

**Langkah 5:**
**Add the following code program in the scope void main(), then try executing (Run) this code.**

```dart
var mahasiswa2 = ('first', a: 2, b: true, 'last');

print(mahasiswa2.$1); // Prints 'first'
print(mahasiswa2.a); // Prints 2
print(mahasiswa2.b); // Prints true
print(mahasiswa2.$2); // Prints 'last'
```
**What happened? If error occurs, please correct. Change one of the same records with name and NIM and then document the results and create reports!**
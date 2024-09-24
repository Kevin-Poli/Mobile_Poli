void main(List<String> args) {
  var list = [1, 2, 3];
  var list2 = [0, ...list];

  var list1 = [1,2,null];
  print(list1);
  var list3 = [0,...?list1];
  print(list3.length);
  print(list2);
  print(list2.length);

  var nim =["2241760125","SIB 3D"];
  print(nim);

  bool promoActive = false;
  var nav =['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet']; 
  print(nav);


  var login = 'manager';
  var nav2 =['Home','Furniture','Plants', if(login == 'manager') 'inventory'];
print(nav2);

var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
assert(listOfStrings[1] == '#1');
print(listOfStrings);
}
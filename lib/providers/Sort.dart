String cba = "sort=";
double rng = 0;
String savevalue = "";
String valuta;
String ghh = "";
String savesearch = "";
var libre = false;
var libre1 = false;
bool showpage = false;
var map = {"isSelected": false, "isSelected1": false, "isSelected2": false};
var map1 = Map();
abc() {
  String abc = cba;
  print(abc);
  return abc;
}
String categories = "all";
toggleFavorite(bool b, String a) {
  if (b) {
    cba += a;
    print(cba);

    return;
  }
  cba = cba.replaceAll(a, "");

  print(cba);
}

toggleprice(double b) {
  if (rng > 0) {
    savevalue = "&max_price=${rng.round()}";

    print(savevalue);
    return;
  } else {
    savevalue = "";
  }
  savevalue = savevalue.replaceAll("&max_price=${rng.round()}", "");

  print(savevalue);
}

priceConvert(double a) {
  if (a == 0) {
    ghh = "Будь-яка";
  } else if (a < 1000) {
    ghh = "${a.round()}" + r" $";
  } else if (a < 1000000) {
    ghh = "${(a / 1000).round()} тис." + r" $";
  } else if (a <= 5000000) {
    ghh = "${(a / 1000000).toStringAsFixed(1)} млн." + r" $";
  }
  return ghh;
}

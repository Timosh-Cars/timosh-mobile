import 'package:money2/money2.dart';

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
  
  return abc;
}
String categories = "all";
toggleFavorite(bool b, String a) {
  if (b) {
    cba += a;


    return;
  }
  cba = cba.replaceAll(a, "");


}

toggleprice(double b) {
  if (rng > 0) {
    savevalue = "&max_price=${rng.round()}";

    return;
  } else {
    savevalue = "";
  }
  savevalue = savevalue.replaceAll("&max_price=${rng.round()}", "");


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

  convertCurrency(String currency) {
    Money costPrice =
        Money.fromInt(int.parse(currency), Currency.create('UAH', 0));
    return costPrice.format("###,###").replaceAll(',', ' ');
  }

    removeAllHtmlTags(String htmlText) {
      RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
      return htmlText.replaceAll(exp, '');
    }

  convertTimeToString(String dateCreated) {
    final difference =
        DateTime.now().difference(DateTime.parse(dateCreated)).inSeconds;
    if (difference <= 0) {
      dateCreated = 'зараз';
    } else if (difference < 60) {
      dateCreated = "${difference} сек. тому";
    } else if (difference < 3600) {
      dateCreated = "${(difference / 60).floor()} хв. тому";
    } else if (difference < 86400) {
      dateCreated = "${(difference / 3600).floor()} год. тому";
    } else if (difference < 604800) {
      dateCreated = "${(difference / 86400).floor()} дн. тому";
    } else if (difference < 2592000) {
      dateCreated = "${(difference / 604800).floor()} тиж. тому";
    } else if (difference < 31536000) {
      dateCreated = "${(difference / 2592000).floor()} міс. тому";
    } else if (difference > 31536000) {
      dateCreated = "${(difference / 31536000).floor()} рк. тому";
    }
    return dateCreated;
  }
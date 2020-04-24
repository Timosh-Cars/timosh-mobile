import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:timosh_app/DataList.dart';
import 'package:timosh_app/Searchb.dart';
import 'package:timosh_app/models/car.dart';
import 'package:timosh_app/providers/Sort.dart';
import 'package:timosh_app/providers/carsProvider.dart';
import 'package:money2/money2.dart';
import 'package:timosh_app/ui/ModalInsideModal.dart';
import 'bottomSheetContent.dart';
import 'detailsPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CarsList extends StatefulWidget {
  List<Car> cars;

  CarsList({this.cars});

  @override
  State<StatefulWidget> createState() {
    return CarsListState();
  }
}

class CarsListState extends State<CarsList> {
  bool isLoading = false;
  bool isLoading1 = false;
  int _offset = 1;
  String message = "";
  CarsProvider _carsProvider = CarsProvider();
  String run;
  ScrollController _controller;

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      /* setState(() {
       
          
            print("message");
      });*/
      loadMoreCars();
    }
    /*
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      
      setState(() {
        message = "reach the top";
      });
    }*/
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _convertTimeToString(String dateCreated) {
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

  _convertCurrency(String currency) {
    Money costPrice =
        Money.fromInt(int.parse(currency), Currency.create('UAH', 0));
    return costPrice.format("###,###").replaceAll(',', ' ');
  }

  loadMoreCars() async {
    setState(() => isLoading = true);
    _offset++;
    var carsToAdd = await _carsProvider.fetchCars(_offset, cba, savevalue, categories);
    setState(() {
      widget.cars.addAll(carsToAdd);
    });
    setState(() => isLoading = false);
  }
/*
  refreshCars() async {
    setState(() => isLoading1 = true);
    _offset = 100;
    var carsToAdd = await _carsProvider.fetchCars(_offset, "");
    widget.cars.clear();
    widget.cars.addAll(carsToAdd);
    setState(() => isLoading1 = false);
  }
*/
  closebottom(int a, String b, String pricing, String ctg) async {
    setState(() => isLoading1 = true);
    var carsToAdd = await _carsProvider.fetchCars(a, b, pricing, ctg);
    widget.cars.clear();
    widget.cars.addAll(carsToAdd);
    setState(() => isLoading1 = false);
  }

  displayBottomSheet() {
    run = cba + savevalue;
print(run);
    showModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      backgroundColor: Color(0xaa15202b).withOpacity(1),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      builder: (context) {
        return FavoriteWidget();
      },
    ).whenComplete(() {
      print('Зкрыто');

      print(run);
      print(cba);
      if (run != cba + savevalue) {
        closebottom(1, cba, savevalue, categories);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xaa15202b),
      floatingActionButton: FlatButton(
        onPressed: () {
showMaterialModalBottomSheet(
  context: context,
  elevation: 400,
  builder: (context, scrollController) => ModalInsideModal(scrollController: scrollController));
        },
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.0)),
        color: Color(0xaa15202b),
        textColor: Colors.white,
        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Icon(Icons.filter_list),
      ),
      body: ListView(
        controller: _controller,
        children: <Widget>[
/*
                  Container(
        height: 40,
        color: Colors.deepOrange,
        child: Center(
          child: Text(
            'Header',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),

*/

          Padding(
              padding: EdgeInsets.only(right: 12, left: 12, top: 12),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                  
                     GestureDetector(
        onTap: () {
       showSearch(
                          context: context,
                          delegate: DataSearch(listWords)).whenComplete(() {
                            print(savesearch);
      print('Зкрыто search');
 closebottom(1, cba, savevalue, categories);
    });
        },
                      child: Container(
                          padding:
                              EdgeInsets.only(left: 12,right:12),
                          height: 55,
                          color: Color(0xff183047),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: 
                            
                            Row(children: <Widget>[
                              Padding(padding:
                              EdgeInsets.only(right:12), child:
      Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 24.0,
                              semanticLabel: 'Пошук',
                            )),
                            Text(savesearch.isEmpty ? 'Введіть текст' : savesearch,
                                textAlign: TextAlign.left,
                              style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: savesearch.isEmpty ? Colors.grey : Colors.white,
                              fontSize: 16),
                                ),
                            ])))
                      /*
TextField(
  
  decoration: InputDecoration(
       border: new OutlineInputBorder(
        borderRadius: BorderRadius.all(
        Radius.circular(12.0),
        ),
      ),
fillColor: Color(0xff183047), filled: true,
  
        labelText: 'Введіть марку чи модель авто',
    
  ),
)*/
                      ))),
          Container(
      height: 60,
      child:
          
          ListView(
              scrollDirection: Axis.horizontal,
             physics: ScrollPhysics(),
            shrinkWrap: true,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: ChoiceChip(
                      labelPadding: const EdgeInsets.only(
                      left: 15,right:15,
                    ),
                      backgroundColor: Color(0xff183047),
                      selected: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      selectedColor: Color(0xff82cc00),
                      disabledColor: Color(0xff183047),
                      onSelected: (state) {displayBottomSheet();},
                      label: Text("Фільтр",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16)),
                    )),

Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: ChoiceChip(
                      labelPadding: const EdgeInsets.only(
                      left: 20,right:20
                    ),
                      backgroundColor: Color(0xff183047),
                      selected: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      selectedColor: Color(0xff82cc00),
                      disabledColor: Color(0xff183047),
                      onSelected: (state) {showBarModalBottomSheet(
                            expand: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context, scrollController) =>
                                ModalInsideModal(
                                    scrollController: scrollController),
                          );},
                      label: Text("Фільтр",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16)),
                    )),

                    Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: ChoiceChip(
                      labelPadding: const EdgeInsets.only(
                      left: 20,right:20
                    ),
                      backgroundColor: Color(0xff183047),
                      selected: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      selectedColor: Color(0xff82cc00),
                      disabledColor: Color(0xff183047),
                      onSelected: (state) {showCupertinoModalBottomSheet(
                            expand: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context, scrollController) =>
                                ModalInsideModal(
                                    scrollController: scrollController),
                          );},
                      label: Text("Фільтр",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16)),
                    )),
                    Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: ChoiceChip(
                      labelPadding: const EdgeInsets.only(
                      left: 20,right:20
                    ),
                      backgroundColor: Color(0xff183047),
                      selected: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      selectedColor: Color(0xff82cc00),
                      disabledColor: Color(0xff183047),
                      onSelected: (state) {showMaterialModalBottomSheet(
                            expand: false,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context, scrollController) =>
                                ModalFit(scrollController: scrollController),
                          );},
                      label: Text("Фільтр",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16)),
                    )),
                    Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: ChoiceChip(
                      labelPadding: const EdgeInsets.only(
                      left: 20,right:20
                    ),
                      backgroundColor: Color(0xff183047),
                      selected: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      selectedColor: Color(0xff82cc00),
                      disabledColor: Color(0xff183047),
                      onSelected: (state) {},
                      label: Text("Фільтр",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16)),
                    ))



              ])),


          ListView.builder(
            padding: EdgeInsets.only(bottom: 70),
            itemCount: widget.cars.length,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () =>
                    /* _refreshCars() */

                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(),
                    settings: RouteSettings(
                      arguments: widget.cars[index],
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 20,
                        right: 12,
                      ),
                      // handle your onTap here
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Hero(
                              tag: 'imageHero' +
                                  widget.cars[index].id.toString(),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/450x450.jpg',
                                image: widget
                                    .cars[index].attributes[15].options[0]
                                    .split(' ')[0],
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.width * 0.75,
                                width: double.infinity,
                              ))),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 6,
                          top: 8,
                        ),
                        child: Text(
                          widget.cars[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 19),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
                                top: 6,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "${_convertCurrency(widget.cars[index].attributes[2].options[0])} км",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              '•',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              widget.cars[index].attributes[4].options[0],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              '•',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              widget.cars[index].attributes[5].options[0],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              '•',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              widget.cars[index].attributes[7].options[0],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              top: 6,
                            ),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 16.0,
                              semanticLabel: 'Локація',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 4,
                              top: 6,
                            ),
                            child: Text(
                              widget.cars[index].attributes[0].options[0],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                top: 6,
                              ),
                              child: Text(
                                "${_convertCurrency(widget.cars[index].price)}" +
                                    r" $",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 20),
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 12,
                              top: 6,
                            ),
                            child: Text(
                              _convertTimeToString(
                                  widget.cars[index].dateCreated),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          /* if (isLoading)
          Positioned(
            child: CupertinoActivityIndicator(),
            bottom: 30,
            left: MediaQuery.of(context).size.width / 2 - 20,
          )
        else if (isLoading1)
          Positioned(
            
            child: CupertinoActivityIndicator(),
            top: MediaQuery.of(context).size.height / 2 - 20,
            left: MediaQuery.of(context).size.width / 2 - 20,
          )*/

          if (isLoading)
         CupertinoActivityIndicator()
           
          
        else if (isLoading1)
         CupertinoActivityIndicator()
           
        ],
      ),
    );
  }
}

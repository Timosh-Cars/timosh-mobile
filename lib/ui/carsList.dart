import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timosh_app/DataList.dart';
import 'package:timosh_app/Searchb.dart';
import 'package:timosh_app/home_viewmodel.dart';
import 'package:timosh_app/models/car.dart';
import 'package:timosh_app/providers/Sort.dart';
import 'package:timosh_app/providers/carsProvider.dart';
import 'package:timosh_app/ui/Widgetis.dart';
import 'bottomSheetContent.dart';
import 'creation_aware_list_item.dart';
import 'detailsPage.dart';
import 'dotsIndicator.dart';

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
  //10125
 
  String message = "";
  //CarsProvider _carsProvider = CarsProvider();
  String run;
  ScrollController _controller;
  List<String> _items;
  List<String> get items => _items;


  static const int ItemRequestThreshold = 10;
    int _current = 0;
 static final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

 List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
  FadeInImage.assetNetwork(
                                  placeholder: 'assets/450x450.jpg',
                                  image: /*arr[i],*/
                                      item,
                                  fit: BoxFit.cover,
                         width: double.infinity, height: double.infinity
                                ),

      
        ],
      )
    ),
  ),
)).toList();


  /*
  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      /* setState(() {
       
          
            print("message");
      });*/
     // loadMoreCars();
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
  }*/

/*
  loadMoreCars() async {
    offset++;
    var carsToAdd =
        await _carsProvider.fetchCars(offset, cba, savevalue, categories);

    setState(() {
      widget.cars.addAll(carsToAdd);
    });
  }
*/
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
/*
  closebottom(int a, String b, String pricing, String ctg) async {
    setState(() => isLoading1 = true);
    var carsToAdd = await _carsProvider.fetchCars(a, b, pricing, ctg);
    widget.cars.clear();
    widget.cars.addAll(carsToAdd);

    setState(() => isLoading1 = false);
offset = 1;
currentPage = 0;
  }
*/
  displayBottomSheet() {
    run = cba + savevalue;

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
      if (run != cba + savevalue) {
       // closebottom(1, cba, savevalue, categories);
        
      }
    });
  }
  displayBottomSheet2() {
    run = cba + savevalue;

    showModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      backgroundColor: Color(0xaa15202b).withOpacity(1),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      builder: (context) {
        return Widgetis();
      },
    ).whenComplete(() {
      if (run != cba + savevalue) {
       // closebottom(1, cba, savevalue, categories);
        
      }
    });
  }


  displayBottomSheet1() {
    run = cba + savevalue;

    showBottomSheet<void>(
      context: context,
      backgroundColor: Color(0xaa15202b).withOpacity(1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      builder: (context) {
        return FavoriteWidget();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // print(widget.cars.length);
    return Scaffold(
      backgroundColor: Color(0xaa15202b).withOpacity(1),
      /* floatingActionButton: FlatButton(
        onPressed: () {
        

        
        },
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.0)),
        color: Color(0xaa15202b),
        textColor: Colors.white,
        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Icon(Icons.filter_list),
      ),*/
      body: CustomScrollView(
   // controller: _controller,
          slivers: [
            SliverToBoxAdapter(
              child:   Wrap(
                children:[
                    Padding(
              padding: EdgeInsets.only(right: 12, left: 12, top: 34),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GestureDetector(
                      onTap: () {
                        showSearch(
                                context: context,
                                delegate: DataSearch(listWords))
                            .whenComplete(() {
                         // closebottom(1, cba, savevalue, categories);
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(left: 6, right: 12),
                          height: 50,
                          color: Color(0xff183047),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(children: <Widget>[
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 12, left: 6),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: 24.0,
                                      semanticLabel: 'Пошук',
                                    )),
                                Flexible(
                                  child: Text(
                                    savesearch.isEmpty
                                        ? 'Введіть марку або модель авто'
                                        : savesearch,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: savesearch.isEmpty
                                            ? Colors.grey
                                            : Colors.white,
                                        fontSize: 14),
                                  ),
                                )
                              ])))
                      ))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: ChoiceChip(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    backgroundColor: Color(0xff183047).withOpacity(1),
                    selected: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    selectedColor: Color(0xff82cc00).withOpacity(1),
                    disabledColor: Color(0xff183047).withOpacity(1),
                    onSelected: (state) {
                      displayBottomSheet();
                    },
                    label: Text("Фільтр",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 14)),
                  ))),
   Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: ChoiceChip(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    backgroundColor: Color(0xff183047).withOpacity(1),
                    selected: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    selectedColor: Color(0xff82cc00).withOpacity(1),
                    disabledColor: Color(0xff183047).withOpacity(1),
                    onSelected: (state) {
                      displayBottomSheet1();
                    },
                    label: Text("Фільтр1",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 14)),
                  ))),
   Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: ChoiceChip(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    backgroundColor: Color(0xff183047).withOpacity(1),
                    selected: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    selectedColor: Color(0xff82cc00).withOpacity(1),
                    disabledColor: Color(0xff183047).withOpacity(1),
                    onSelected: (state) {
                      displayBottomSheet2();
                    },
                    label: Text("Фільтр2",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 14)),
                  ))),
                ])

            ),

            
            SliverToBoxAdapter(
              child:
      Column(
        children: [
          CarouselSlider(
            items: imageSliders,
            
            options: CarouselOptions(
  
      aspectRatio: 1/1,
      viewportFraction: 1,
      initialPage: 0,
      enableInfiniteScroll: false,
      reverse: false,
      autoPlay: false,

          height: MediaQuery.of(context).size.width * 1,
          
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
            ),
          ),



          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ]
      ),
            ),
       


  SliverToBoxAdapter(
              child:
       Stack(children: <Widget>[
            ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 0),
              itemCount: 1,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return _buildCarousel(context, 1);
                } else {
                  return Divider();
                }
              },
            ),
          ])),

            



            SliverToBoxAdapter(
              child: Ink(
               child:
               Visibility(
              
                 visible: true,
                 child: 
            CupertinoActivityIndicator()),
                height: 50.0,
              ),
            ),
            
          ],
        ),

    );
  }
}

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    final Car selectedCar = ModalRoute.of(context).settings.arguments;
    var arr = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];;
  final _controller = new PageController();

 const _kDuration = const Duration(milliseconds: 100);

   const _kCurve = Curves.easeInOutQuart;

  final _kArrowColor = Colors.black.withOpacity(0.8);
  int _current = 0;

    final List<Widget> _pages = <Widget>[
      for (var i = 0; i < arr.length; i++)
        //Image.network(arr[i],fit: BoxFit.cover, width: double.infinity, height: double.infinity),

            FadeInImage.assetNetwork(
                                  placeholder: 'assets/450x450.jpg',
                                  image: /*arr[i],*/
                                      arr[i],
                                  fit: BoxFit.cover,
                         width: double.infinity, height: double.infinity
                                )
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.width * 1,
          child: Stack(
            children: <Widget>[
              PageView.builder(
                // store this controller in a State to save the carousel scroll position
                controller: _controller,
                itemCount: _pages.length,
                itemBuilder: (BuildContext context, int itemIndex) {
                  return _pages[itemIndex % _pages.length];
                },
              ),
         
              Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    child: new Container(
                      height: 12,
                      child: DotsIndicator(
                        controller: _controller,
                        itemCount: _pages.length,
                        onPageSelected: (int page) {
                          _controller.animateToPage(
                            page,
                            duration: _kDuration,
                            curve: _kCurve,
                          );
                        },
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
/*


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timosh_app/DataList.dart';
import 'package:timosh_app/Searchb.dart';
import 'package:timosh_app/home_viewmodel.dart';
import 'package:timosh_app/models/car.dart';
import 'package:timosh_app/providers/Sort.dart';
import 'package:timosh_app/providers/carsProvider.dart';
import 'bottomSheetContent.dart';
import 'creation_aware_list_item.dart';
import 'detailsPage.dart';

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
  //10125
 
  String message = "";
  CarsProvider _carsProvider = CarsProvider();
  String run;
  ScrollController _controller;
  List<String> _items;
  List<String> get items => _items;


  static const int ItemRequestThreshold = 10;
  

  /*
  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      /* setState(() {
       
          
            print("message");
      });*/
     // loadMoreCars();
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
  }*/


  loadMoreCars() async {
    offset++;
    var carsToAdd =
        await _carsProvider.fetchCars(offset, cba, savevalue, categories);

    setState(() {
      widget.cars.addAll(carsToAdd);
    });
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
offset = 1;
currentPage = 0;
  }

  displayBottomSheet() {
    run = cba + savevalue;

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
      if (run != cba + savevalue) {
        closebottom(1, cba, savevalue, categories);
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.cars.length);
    return Scaffold(
      backgroundColor: Color(0xaa15202b).withOpacity(1),
      /* floatingActionButton: FlatButton(
        onPressed: () {
        

        
        },
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.0)),
        color: Color(0xaa15202b),
        textColor: Colors.white,
        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Icon(Icons.filter_list),
      ),*/
      body: CustomScrollView(
   // controller: _controller,
          slivers: [
            SliverToBoxAdapter(
              child:   Wrap(
                children:[
                    Padding(
              padding: EdgeInsets.only(right: 12, left: 12, top: 34),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GestureDetector(
                      onTap: () {
                        showSearch(
                                context: context,
                                delegate: DataSearch(listWords))
                            .whenComplete(() {
                          closebottom(1, cba, savevalue, categories);
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(left: 6, right: 12),
                          height: 50,
                          color: Color(0xff183047),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(children: <Widget>[
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 12, left: 6),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: 24.0,
                                      semanticLabel: 'Пошук',
                                    )),
                                Flexible(
                                  child: Text(
                                    savesearch.isEmpty
                                        ? 'Введіть марку або модель авто'
                                        : savesearch,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: savesearch.isEmpty
                                            ? Colors.grey
                                            : Colors.white,
                                        fontSize: 14),
                                  ),
                                )
                              ])))
                      ))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: ChoiceChip(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    backgroundColor: Color(0xff183047).withOpacity(1),
                    selected: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    selectedColor: Color(0xff82cc00).withOpacity(1),
                    disabledColor: Color(0xff183047).withOpacity(1),
                    onSelected: (state) {
                      displayBottomSheet();
                    },
                    label: Text("Фільтр",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 14)),
                  ))),


                ])

            ),

            
           ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) =>  SliverList(

              
              
              delegate: SliverChildBuilderDelegate(
                
                (ctx, index) => 
                
                 CreationAwareListItem(
                itemCreated: (){
                  print('Item created at $index');
                  


                     var itemPosition = index + 1;

    var requestMoreData =
        itemPosition % ItemRequestThreshold == 0 && itemPosition != 0;
    var pageToRequest = itemPosition ~/ ItemRequestThreshold;

print('$requestMoreData ||  $pageToRequest');
print(currentPage);
    if (requestMoreData && pageToRequest > currentPage) {
      currentPage = pageToRequest;

      loadMoreCars();
    
    }
                },
                child:
                GestureDetector(
                  
                onTap: () =>
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarouselWithIndicatorDemo(),
                    settings: RouteSettings(
                      arguments: widget.cars[index],
                    ),
                  ),
                ),
                
                child:
                
                 Column(
                  
                  children: <Widget>[
                  Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          top: 25,
                          right: 12,
                        ),
                        // handle your onTap here
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child:  FadeInImage.assetNetwork(
                                  placeholder: 'assets/450x450.jpg',
                                  image: /*widget
                                      .cars[index].attributes[15].options[0]
                                      .split(' ')[0],*/
                                      'https://topgir.com.ua/wp-content/uploads/2019/02/lamborghini-urus-%D0%B2-%D1%83%D0%BA%D1%80%D0%B0%D0%B8%D0%BD%D0%B5.jpg',
                                  fit: BoxFit.cover,
                                  height:
                                      MediaQuery.of(context).size.width * 0.7,
                                  width: double.infinity,
                                )),
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
                                fontSize: 16),
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
                                  left: 12,
                                  top: 6,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Text(
                                    "${convertCurrency(widget.cars[index].attributes[2].options[0])} км",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 14),
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
                                    fontSize: 14),
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
                                    fontSize: 14),
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
                                    fontSize: 14),
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
                                    fontSize: 14),
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
                                    fontSize: 14),
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
                                    fontSize: 14),
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
                                size: 14.0,
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
                                    fontSize: 14),
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
                                  "${convertCurrency(widget.cars[index].price)} \$",
                                  
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 16),
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
                                convertTimeToString(
                                    widget.cars[index].dateCreated),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                        ],
                      ),


        

                    
                  ],
                ),
              ),
                
                
              ),
              childCount: widget.cars.length,
            )))),

            


            
            SliverToBoxAdapter(
              child: Ink(
               child:
               Visibility(
              
                 visible:widget.cars.length == 0  ? false : true,
                 child: 
            CupertinoActivityIndicator()),
                height: 50.0,
              ),
            ),
            
          ],
        ),

    );
  }
}
*/
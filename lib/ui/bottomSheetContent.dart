import 'package:flutter/material.dart';
import 'package:timosh_app/providers/Sort.dart';
import 'package:timosh_app/providers/carsProvider.dart';
import 'package:flutter/src/material/slider.dart';

import 'SliderWidget.dart';

class FavoriteWidget extends StatefulWidget {
  Function updateList;

  bool isSelected,
      isSelected1,
      isSelected2,
      isSelected3,
      isSelected4,
      isSelected5,
      isSelected6,
      isSelected7,
      isSelected8,
      isSelected9,
      isSelected10,
      isSelected11,
      isSelected12,
      isSelected13,
      isSelected14,
      isSelected15,
      isSelected16, 
      isSelected17,
      isSelected18,
      isSelected19,
      isSelected20,
      isSelected21,
      isSelected22,
      isSelected23,
      isSelected24,
           isSelected25,
      isSelected26,
      isSelected27,
      isSelected28,
      isSelected29,
      isSelected30,
      isSelected31
      = false;

  bool d = false;
  @override
  _BottomSheetContent createState() => _BottomSheetContent();
}

class _BottomSheetContent extends State<FavoriteWidget> {
  var selectedRange = RangeValues(0.2, 0.8);

  bool isLoading1 = false;
  Function updateList;
  int indexSelected = -1;
  var selectedChip = 0;
  bool _isFavorited = true;

  bool b = true;

  Widget _myChip(String a, String b, String c, bool d) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 12,
        ),
        child: ChoiceChip(
          backgroundColor: Color(0xff183047),
          selected: map[a] == null ? false : map[a],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          selectedColor: Color(0xff82cc00),
          disabledColor: Color(0xff183047),
          onSelected: (state) {
            setState(() {
              widget.d = !widget.d;
              _isFavorited = widget.d;
            });
            map[a] = state;
            toggleFavorite(state, b);
          },
          label: Text(c,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 14)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      child: Column(
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Фільтр',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: ListView(padding: EdgeInsets.only(right: 6.0, bottom:25), children: [
              Wrap(direction: Axis.horizontal, children: [
                Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                   
                      top: 15,
                    ),
                    child: Text(
                      'Кузов',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 16),
                    )),
                _myChip(
                    "isSelected", "filter=Седан", 'Седан', widget.isSelected),
                _myChip("isSelected1", "filter=Хетчбек", 'Хетчбек',
                    widget.isSelected1),
                _myChip("isSelected2", "filter=Мікроавтобус", 'Мікроавтобус',
                    widget.isSelected2),
                _myChip("isSelecte3", "filter=Позашляховик", 'Позашляховик',
                    widget.isSelected3),
                _myChip("isSelected4", "filter=Універсал", 'Універсал',
                    widget.isSelected4),
                _myChip(
                    "isSelected5", "filter=Купе", 'Купе', widget.isSelected5),
                _myChip("isSelecte6", "filter=Мінівен", 'Мінівен',
                    widget.isSelected6),
                _myChip("isSelected7", "filter=Кабріолет", 'Кабріолет',
                    widget.isSelected7),
                _myChip(
                    "isSelected8", "filter=Пікап", 'Пікап', widget.isSelected8),

/*
                Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: ChoiceChip(
                      backgroundColor: Color(0xff183047),
                      selected:
                          map["isSelected"] == null ? false : map["isSelected"],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      selectedColor: Color(0xff82cc00),
                      disabledColor: Color(0xff183047),
                      onSelected: (state) {
                        setState(() {
                          widget.isSelected = !widget.isSelected;
                          _isFavorited = widget.isSelected;
                        });

                        map["isSelected"] = state;
                        toggleFavorite(state, "filter=Седан");
                      },
                      label: Text('Седан',
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
                      backgroundColor: Color(0xff183047),
                      selected: map["isSelected1"] == null
                          ? false
                          : map["isSelected1"],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      selectedColor: Color(0xff82cc00),
                      disabledColor: Color(0xff183047),
                      onSelected: (state) {
                        setState(() {
                          widget.isSelected1 = !widget.isSelected1;
                          _isFavorited = widget.isSelected1;
                        });

                        map["isSelected1"] = state;
                        toggleFavorite(state, "filter=Хетчбек");
                      },
                      label: Text('Хетчбек',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16)),
                    )),
     
                Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: InputChip(
                      backgroundColor: Color(0xff183047),
                      checkmarkColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      selectedColor: Colors.blue,
                      disabledColor: Color(0xff183047),
                      onPressed: () {},
                      label: Text(
                        'Позашляховик',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    )),
            */
              ]),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Wrap(direction: Axis.horizontal, children: [
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                        
                          top: 15,
                        ),
                        child: Text(
                          'Рік випуску',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16),
                        )),
                    _myChip("isSelected9", "filter=- 1980", '- 1980',
                        widget.isSelected9),
                    _myChip("isSelected10", "filter=1980-1990", '1980 - 1990',
                        widget.isSelected10),
                    _myChip("isSelected11", "filter=1990-2000", '1990 - 2000',
                        widget.isSelected11),
                    _myChip("isSelected12", "filter=2000-2010", '2000 - 2010',
                        widget.isSelected12),
                    _myChip("isSelected13", "filter=2010-2019", '2010 - 2019',
                        widget.isSelected13),
                    _myChip("isSelected14", "filter=2020 +", '2020 +',
                        widget.isSelected14),
                  ])),


        Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Wrap(direction: Axis.horizontal, children: [
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          
                          top: 15,
                        ),
                        child: Text(
                          'Пробіг',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16),
                        )),
                    _myChip("isSelected15", "filter=0 - 10 000 км", '0 - 10 000 км',
                        widget.isSelected15),
                    _myChip("isSelected16", "filter=10 000 - 50 000 км", '10 000 - 50 000 км',
                        widget.isSelected16),
                    _myChip("isSelected17", "filter=50 000 - 100 000 км", '50 000 - 100 000 км',
                        widget.isSelected17),
                    _myChip("isSelected18", "filter=100 000 км і більше", '100 000 км і більше',
                        widget.isSelected18),
                   
                  ])),



      Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Wrap(direction: Axis.horizontal, children: [
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                    
                          top: 15,
                        ),
                        child: Text(
                          'Привід',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16),
                        )),
                    _myChip("isSelected19", "filter=Повний", 'Повний',
                        widget.isSelected19),
                    _myChip("isSelected20", "filter=Задній", 'Задній',
                        widget.isSelected20),
                    _myChip("isSelected21", "filter=Передній", 'Передній',
                        widget.isSelected21),
                   
                  ])),

                    Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Wrap(direction: Axis.horizontal, children: [
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          top: 15,
                        ),
                        child: Text(
                          'Коробка',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16),
                        )),
                    _myChip("isSelected22", "filter=Механіка", 'Механіка',
                        widget.isSelected22),
                    _myChip("isSelected23", "filter=Автомат", 'Автомат',
                        widget.isSelected23),
                
                   
                  ])),


                          Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Wrap(direction: Axis.horizontal, children: [
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          top: 15,
                        ),
                        child: Text(
                          'Паливо',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16),
                        )),
                    _myChip("isSelected24", "filter=Бензин", 'Бензин',
                        widget.isSelected24),
                    _myChip("isSelected25", "filter=Дизель", 'Дизель',
                        widget.isSelected25),
                  _myChip("isSelected26", "filter=Електро", 'Електро',
                        widget.isSelected26),  _myChip("isSelected27", "filter=Газ", 'Газ',
                        widget.isSelected27),  
                        _myChip("isSelected28", "filter=Гибрид", 'Гибрид',
                        widget.isSelected28), 
                  ])),



                                 Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Wrap(direction: Axis.horizontal, children: [
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          top: 15,
                        ),
                        child: Text(
                          'Таможня',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 16),
                        )),
                    _myChip("isSelected29", "filter=Розмитнена", 'Розмитнена',
                        widget.isSelected29),
                    _myChip("isSelected30", "filter=Нерозмитнена", 'Нерозмитнена',
                        widget.isSelected30),
                 
                  ])),
   
              SliderWidget(),
            ]),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:timosh_app/providers/Sort.dart';
import 'SliderWidget.dart';

class FavoriteWidget extends StatefulWidget {
  bool isSelected,
      isSelected1,
      isSelected2,
      isSelected3,
      isSelected4,
      isSelected5,
      isSelected6,
      // isSelected7,
      // isSelected8,
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
      isSelected31 = false;

  bool d = false;
  @override
  _BottomSheetContent createState() => _BottomSheetContent();
}

class _BottomSheetContent extends State<FavoriteWidget> {
  var selectedRange = RangeValues(0.2, 0.8);

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
            child: ListView(
                padding: EdgeInsets.only(right: 6.0, bottom: 25),
                children: [
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
                        "isSelected",
                        "&attribute=pa_кузов&attribute_term=24",
                        'Седан',
                        widget.isSelected),
                    _myChip(
                        "isSelected1",
                        "f&attribute=pa_кузов&attribute_term=25",
                        'Хетчбек',
                        widget.isSelected1),
                    _myChip(
                        "isSelected2",
                        "&attribute=pa_кузов&attribute_term=26",
                        'Мікроавтобус',
                        widget.isSelected2),
                    _myChip(
                        "isSelecte3",
                        "&attribute=pa_кузов&attribute_term=27",
                        'Позашляховик',
                        widget.isSelected3),
                    _myChip(
                        "isSelected4",
                        "&attribute=pa_кузов&attribute_term=28",
                        'Універсал',
                        widget.isSelected4),
                    _myChip(
                        "isSelected5",
                        "&attribute=pa_кузов&attribute_term=29",
                        'Купе',
                        widget.isSelected5),
                    _myChip(
                        "isSelecte6",
                        "&attribute=pa_кузов&attribute_term=30",
                        'Мінівен',
                        widget.isSelected6)
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
                        _myChip(
                            "isSelected9",
                            "&attribute=pa_рік-випуску&attribute_term=110",
                            '- 1980',
                            widget.isSelected9),
                        _myChip(
                            "isSelected10",
                            "&attribute=pa_рік-випуску&attribute_term=114",
                            '1980 - 1990',
                            widget.isSelected10),
                        _myChip(
                            "isSelected11",
                            "&attribute=pa_рік-випуску&attribute_term=113",
                            '1990 - 2000',
                            widget.isSelected11),
                        _myChip(
                            "isSelected12",
                            "&attribute=pa_рік-випуску&attribute_term=109",
                            '2000 - 2010',
                            widget.isSelected12),
                        _myChip(
                            "isSelected13",
                            "&attribute=pa_рік-випуску&attribute_term=1785",
                            '2010 - 2019',
                            widget.isSelected13),
                        _myChip(
                            "isSelected14",
                            "&attribute=pa_рік-випуску&attribute_term=112",
                            '2020 +',
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
                        _myChip(
                            "isSelected15",
                            "&attribute=pa_пробіг&attribute_term=69",
                            '0 - 10 000 км',
                            widget.isSelected15),
                        _myChip(
                            "isSelected16",
                            "&attribute=pa_пробіг&attribute_term=81",
                            '10 000 - 50 000 км',
                            widget.isSelected16),
                        _myChip(
                            "isSelected17",
                            "&attribute=pa_пробіг&attribute_term=82",
                            '50 000 - 100 000 км',
                            widget.isSelected17),
                        _myChip(
                            "isSelected18",
                            "&attribute=pa_пробіг&attribute_term=83",
                            '100 000 км і більше',
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
                        _myChip(
                            "isSelected19",
                            "&attribute=pa_привід&attribute_term=64",
                            'Повний',
                            widget.isSelected19),
                        _myChip(
                            "isSelected20",
                            "&attribute=pa_привід&attribute_term=65",
                            'Задній',
                            widget.isSelected20),
                        _myChip(
                            "isSelected21",
                            "&attribute=pa_привід&attribute_term=66",
                            'Передній',
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
                        _myChip(
                            "isSelected22",
                            "&attribute=pa_коробка&attribute_term=60",
                            'Механіка',
                            widget.isSelected22),
                        _myChip(
                            "isSelected23",
                            "&attribute=pa_коробка&attribute_term=61",
                            'Автомат',
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
                        _myChip(
                            "isSelected24",
                            "&attribute=pa_паливо&attribute_term=55",
                            'Бензин',
                            widget.isSelected24),
                        _myChip(
                            "isSelected25",
                            "&attribute=pa_паливо&attribute_term=56",
                            'Дизель',
                            widget.isSelected25),
                        _myChip(
                            "isSelected26",
                            "&attribute=pa_паливо&attribute_term=58",
                            'Електро',
                            widget.isSelected26),
                        _myChip(
                            "isSelected27",
                            "&attribute=pa_паливо&attribute_term=59",
                            'Газ',
                            widget.isSelected27),
                        _myChip(
                            "isSelected28",
                            "&attribute=pa_паливо&attribute_term=1803",
                            'Гибрид',
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
                        _myChip(
                            "isSelected29",
                            "&attribute=pa_таможня&attribute_term=1787",
                            'Розмитнена',
                            widget.isSelected29),
                        _myChip(
                            "isSelected30",
                            "&attribute=pa_таможня&attribute_term=68",
                            'Нерозмитнена',
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

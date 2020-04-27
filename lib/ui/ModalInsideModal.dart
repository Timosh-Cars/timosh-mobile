import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:timosh_app/providers/Sort.dart';
import 'package:timosh_app/ui/SliderWidget.dart';

class ModalInsideModal extends StatelessWidget {
  final ScrollController scrollController;

  const ModalInsideModal({Key key, this.scrollController}) : super(key: key);
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
          label: Text(c,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 14)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 180.0,
        child: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                leading: Container(), middle: Text('Фільтр')),
            child: SafeArea(
              bottom: false,
              child: Container(
                height: 500,
                child: ListView(
                    padding: EdgeInsets.only(right: 6.0, bottom: 25),
                    shrinkWrap: true,
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
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
                        _myChip("isSelected", "filter=Седан", 'Седан', true),
                        _myChip(
                            "isSelected1", "filter=Хетчбек", 'Хетчбек', true),
                        _myChip("isSelected2", "filter=Мікроавтобус",
                            'Мікроавтобус', true),
                        _myChip("isSelecte3", "filter=Позашляховик",
                            'Позашляховик', true),
                        _myChip("isSelected4", "filter=Універсал", 'Універсал',
                            true),
                        _myChip("isSelected5", "filter=Купе", 'Купе', true),
                        _myChip(
                            "isSelecte6", "filter=Мінівен", 'Мінівен', true),
                        _myChip("isSelected7", "filter=Кабріолет", 'Кабріолет',
                            true),
                        _myChip("isSelected8", "filter=Пікап", 'Пікап', true),

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
                            _myChip(
                                "isSelected9", "filter=- 1980", '- 1980', true),
                            _myChip("isSelected10", "filter=1980-1990",
                                '1980 - 1990', true),
                            _myChip("isSelected11", "filter=1990-2000",
                                '1990 - 2000', true),
                            _myChip("isSelected12", "filter=2000-2010",
                                '2000 - 2010', true),
                            _myChip("isSelected13", "filter=2010-2019",
                                '2010 - 2019', true),
                            _myChip("isSelected14", "filter=2020 +", '2020 +',
                                true),
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
                            _myChip("isSelected15", "filter=0 - 10 000 км",
                                '0 - 10 000 км', true),
                            _myChip("isSelected16", "filter=10 000 - 50 000 км",
                                '10 000 - 50 000 км', true),
                            _myChip(
                                "isSelected17",
                                "filter=50 000 - 100 000 км",
                                '50 000 - 100 000 км',
                                true),
                            _myChip(
                                "isSelected18",
                                "filter=100 000 км і більше",
                                '100 000 км і більше',
                                true),
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
                                true),
                            _myChip("isSelected20", "filter=Задній", 'Задній',
                                true),
                            _myChip("isSelected21", "filter=Передній",
                                'Передній', true),
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
                            _myChip("isSelected22", "filter=Механіка",
                                'Механіка', true),
                            _myChip("isSelected23", "filter=Автомат", 'Автомат',
                                true),
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
                                true),
                            _myChip("isSelected25", "filter=Дизель", 'Дизель',
                                true),
                            _myChip("isSelected26", "filter=Електро", 'Електро',
                                true),
                            _myChip("isSelected27", "filter=Газ", 'Газ', true),
                            _myChip("isSelected28", "filter=Гибрид", 'Гибрид',
                                true),
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
                            _myChip("isSelected29", "filter=Розмитнена",
                                'Розмитнена', true),
                            _myChip("isSelected30", "filter=Нерозмитнена",
                                'Нерозмитнена', true),
                          ])),
                      SliderWidget(),
                    ]),
              ),
            )));
  }
}

class ModalFit extends StatelessWidget {
  final ScrollController scrollController;

  const ModalFit({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Edit'),
            leading: Icon(Icons.edit),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Copy'),
            leading: Icon(Icons.content_copy),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Cut'),
            leading: Icon(Icons.content_cut),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Move'),
            leading: Icon(Icons.folder_open),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Delete'),
            leading: Icon(Icons.delete),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    ));
  }
}

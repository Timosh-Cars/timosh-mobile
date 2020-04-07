import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timosh_app/providers/carsProvider.dart';
import 'package:timosh_app/ui/carsList.dart';

import 'models/car.dart';
import 'ui/bottomSheetContent.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  HomePage({Key key}) : super(key: key);

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.red,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      builder: (context) {
        return BottomSheetContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xaa13213e),
      floatingActionButton: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.0)),
        color: Colors.black.withOpacity(0.3),
        textColor: Colors.white,
        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
        onPressed: () {
          _showModalBottomSheet(context);
        },
        child: Icon(Icons.favorite),
      ),
      body: FutureBuilder<List<Car>>(
        //future: fetchPhotos(http.Client()),
        future: CarsProvider().fetchCars(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? CarsList(cars: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
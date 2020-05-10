import 'dart:ui';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timosh_app/providers/carsProvider.dart';
import 'package:timosh_app/ui/carsList.dart';
import 'models/car.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway',
        accentColor: Color(0xff183047).withOpacity(1),
        backgroundColor: Color(0xff183047).withOpacity(1),
        primaryColor: Color(0xff183047).withOpacity(1),
        primaryColorBrightness: Brightness.dark,
        brightness: Brightness.dark,
        primaryColorDark: Color(0xff183047).withOpacity(1),
        scaffoldBackgroundColor: Color(0xff183047).withOpacity(1),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xaa15202b),
        body: Stack(children: [
          Center(
              child: Text(
            "Тімош",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff183047),
                fontSize: 34),
          )),
          Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: FlareActor("assets/hop.flr",
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.contain,
                    animation: "Untitled")),
          )
        ]));
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xaa15202b),
      body: 
          CarsList()
          
        
      
    );
  }
}


/*
import 'dart:ui';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timosh_app/providers/carsProvider.dart';
import 'package:timosh_app/ui/carsList.dart';
import 'models/car.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway',
        accentColor: Color(0xff183047).withOpacity(1),
        backgroundColor: Color(0xff183047).withOpacity(1),
        primaryColor: Color(0xff183047).withOpacity(1),
        primaryColorBrightness: Brightness.dark,
        brightness: Brightness.dark,
        primaryColorDark: Color(0xff183047).withOpacity(1),
        scaffoldBackgroundColor: Color(0xff183047).withOpacity(1),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xaa15202b),
        body: Stack(children: [
          Center(
              child: Text(
            "Тімош",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff183047),
                fontSize: 34),
          )),
          Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: FlareActor("assets/hop.flr",
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.contain,
                    animation: "Untitled")),
          )
        ]));
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xaa15202b),
      body: FutureBuilder<List<Car>>(
        //future: fetchPhotos(http.Client()),

        future: CarsProvider().fetchCars(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? CarsList(cars: snapshot.data)
              : Stack(children: [
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2 - 20,
                      left: MediaQuery.of(context).size.width / 2 - 20,
                      child: Center(child: CircularProgressIndicator()))
                ]);
        },
      ),
    );
  }
}
*/
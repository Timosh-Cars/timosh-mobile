import 'dart:ui';
import 'package:flare_flutter/flare_actor.dart';
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
      theme: ThemeData(fontFamily: 'Raleway', accentColor:Colors.red),
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
    Future.delayed(Duration(seconds: 4), () {
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
      body: Center(
        child:Container( width:MediaQuery.of(context).size.width*0.9, child:FlareActor("assets/hop.flr", alignment:Alignment.bottomCenter, fit:BoxFit.contain, animation:"Untitled")),
    ));
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
              : Stack(children:[Positioned(top: MediaQuery.of(context).size.height / 2 - 20,left: MediaQuery.of(context).size.width / 2 - 20,child: Center(child: CircularProgressIndicator()))]);
        },
      ),
    );
  }
}











import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timosh_app/providers/carsProvider.dart';
import 'package:timosh_app/ui/carsList.dart';
import 'models/car.dart';
import 'ui/bottomSheetContent.dart';
import 'package:flare_flutter/asset_provider.dart';
import 'package:flare_flutter/cache.dart';
import 'package:flare_flutter/cache_asset.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/flare_cache_asset.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flare_flutter/flare_render_box.dart';
import 'package:flare_flutter/flare_testing.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flare_flutter/provider/memory_flare.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway', accentColor:Color(0xaa15202b)),
      home: SplashScreen(),
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
      body: FlareActor("assets/hop.flr", alignment:Alignment.bottomCenter, fit:BoxFit.contain, animation:"Untitled"),
    );
  }
}


class HomePage extends StatelessWidget {

  HomePage({Key key}) : super(key: key);

  void _showModalBottomSheet(BuildContext context) {

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Color(0xaa15202b).withOpacity(1),
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
      backgroundColor: Color(0xaa15202b),
      floatingActionButton: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.0)),
        color: Color(0xaa15202b),
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











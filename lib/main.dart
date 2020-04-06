import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:transparent_image/transparent_image.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
 /* final response =
  await client.get('https://img.timosh.com.ua/wp-json/wc/v2/products?consumer_key=ck_28d2c8eccd91bd2e8df0be1e7a29ce9391d4ba62&consumer_secret=cs_c7a3af5d47e3ba87bbab35242c36072bc461d50f&page=1&per_page=10');
*/
final response =
  await client.get('https://jsonplaceholder.typicode.com/photos');


 
  return compute(parsePhotos, response.body);
}
 

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();


     //parsed.removeWhere((item) => item['name'] == "Mercedes-Benz A class");
   
print(parsed.length);


  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}





class _BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height*0.90, 
      child: Column(
        children: [
          Container(
            height: 70,
            child: Center(
              child: Text(
          'Фільтр',
           style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 24),
          ),
            ),
          ),
          Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 21,
              
              itemBuilder: (context, index) {
                return  
Row(
  mainAxisAlignment: MainAxisAlignment.start,
       
  children: [
   Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:12,
      top: 6,
   
    ), 
    child:
      Chip(
  avatar: CircleAvatar(
    backgroundColor: Colors.grey.shade800,
    child: Text('O'),
  ),
  label: Text('Бензин'),
  )))]);
              },


            ),
          ),
        ],
      ),
    );
  }
}






 // from 0-1.0
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
     /* albumId: json['id'] as int,
      id: json['id'] as int,
      title: json['name'] as String,
      url: 'https://cdn5.vedomosti.ru/crop/image/2018/9x/wcz9w/original-15xv.jpg?height=609&width=1082',
      thumbnailUrl: 'https://cdn5.vedomosti.ru/crop/image/2018/9x/wcz9w/original-15xv.jpg?height=609&width=1082 https://p.bigstockphoto.com/GeFvQkBbSLaMdpKXF1Zv_bigstock-Aerial-View-Of-Blue-Lakes-And--227291596.jpg https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg https://cdn5.vedomosti.ru/crop/image/2018/9x/wcz9w/original-15xv.jpg?height=609&width=1082 https://p.bigstockphoto.com/GeFvQkBbSLaMdpKXF1Zv_bigstock-Aerial-View-Of-Blue-Lakes-And--227291596.jpg https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg https://cdn5.vedomosti.ru/crop/image/2018/9x/wcz9w/original-15xv.jpg?height=609&width=1082 https://p.bigstockphoto.com/GeFvQkBbSLaMdpKXF1Zv_bigstock-Aerial-View-Of-Blue-Lakes-And--227291596.jpg https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg https://cdn5.vedomosti.ru/crop/image/2018/9x/wcz9w/original-15xv.jpg?height=609&width=1082 https://p.bigstockphoto.com/GeFvQkBbSLaMdpKXF1Zv_bigstock-Aerial-View-Of-Blue-Lakes-And--227291596.jpg https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
      */

     albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: 'https://destacar.de/wp-content/uploads/2018/12/DSC8979-5.jpg https://kor.ill.in.ua/m/610x385/2238421.jpg https://gr8auto.com.ua/wp-content/uploads/2019/11/bg-bmw-mobile.jpg',
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Тімош';

    return MaterialApp(
      title: appTitle,
        theme: ThemeData(fontFamily: 'Raleway'),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
          backgroundColor: Colors.red,
       isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
        ),
      builder: (context) {
        
        return _BottomSheetContent();

        
      },
      
    );

  }




  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
        backgroundColor: Color(0xaa13213e),
       floatingActionButton: 
    FlatButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(12.0)
        ),
      color: Colors.black.withOpacity(0.3),
            textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
      onPressed: () {  _showModalBottomSheet(context);},
      child: Icon(Icons.favorite),
      ),
    
      
      body: 
      FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
          
              ? 
      PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },

      ),
      
    );
  }




}


class PhotosList extends StatelessWidget {
  final List<Photo> photos;







  PhotosList({Key key, this.photos}) : super(key: key);


 

  @override
  Widget build(BuildContext context) {
    
    return 
       ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index)
       {
        var arr1 = photos[index].url.split(' ');
        return
     InkWell(
      onTap: () =>  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(),
                  // Pass the arguments as part of the RouteSettings. The
                  // DetailScreen reads the arguments from these settings.
                  settings: RouteSettings(
                    arguments: photos[index],
                    
                  ),
                ),
              ),
             
child:
          Wrap(
            
      children: <Widget>[
       Padding( 
              padding:const EdgeInsets.only(
     left:12,
      top: 20,
   right:12,
 
   
    ),
         // handle your onTap here
      child: 
         ClipRRect(
          
            borderRadius: BorderRadius.circular(12.0),
              child: 
                 Hero(
          tag: 'imageHero' + photos[index].id.toString(),
          child: 

 FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: arr1[0],
        fit: BoxFit.fitWidth,
                 height:300,
  width: double.infinity,
      
      )




                 )
            
    ),
              
              
   
             
       
       ),

Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:12,
     right:6,
      top: 8,
   
    ),
      
      child:
      Text(
         photos[index].title,
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 19),
            overflow: TextOverflow.ellipsis,
          ),),
    ),








Row(
  mainAxisAlignment: MainAxisAlignment.start,
       
  children: [
   Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:12,
      top: 6,
   
    ),
      
      child:
      Text(
          photos[index].albumId.toString(),
           style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16),
          ),),
    ),

Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:6,
      top: 6,
   
    ),
      
      child:
      Text(
         '•',
 style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16),
          ),),
    ),

     Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:6,
      top: 6,
   
    ),
      
      child:
      Text(
         '2014 р',
         style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16),
          ),),
    ),

Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:6,
      top:6,
   
    ),
      
      child:
      Text(
         '•',
      style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16),
          ),),
    ),

      Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:6,
      top: 6,
   
    ),
      
      child:
      Text(
         '5.0 л',
         style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16),
          ),),
    ),


  Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:6,
      top: 6,
   
    ),
      
      child:
      Text(
         '•',
 style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16),
          ),),
    ),




      Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:6,
      top: 6,
   
    ),
      
      child:
      Text(
         'Бензин/Газ',
  style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16),
          ),),
    ),
  ],
),


 

Row(
 mainAxisAlignment: MainAxisAlignment.start,
  children: const <Widget>[
  
        Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:12,
      top: 6,
   
    ),
      
      child:
       Icon(
      Icons.location_on,
      color: Colors.white,
      size: 16.0,
      semanticLabel: 'Локация',
    ),),
    ),

           Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:4,
      top: 6,
   
    ),
      
      child:
    Text(
         'Христиновка',
             style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16),
          ),),
    ),
  ],
),


Row(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: const <Widget>[
  
        Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:12,
      top: 6,
   
    ),
      
      child:
     Text(
         '1 200 000 грн',
         
    style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 19),
          )),
    ),

           Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     right:12,
      top: 6,
   
    ),
      
      child:
    Text(
          '30 хв тому',
 style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 15),
          ),),
    ),
  ],
)






      ],
    ),


           );


      },
    );
    
  }
  
}


class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;
  
 // 487.0,696.0
  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;
Color mainColor = Color(0xffffff).withOpacity(0.3);
  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;
  Widget _buildDot(int index) {
    double selectedness = 
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      );
    
  if(selectedness > 0.5) 
mainColor = Color(0xffffff).withOpacity(1);
else 
 mainColor = Color(0xffffff).withOpacity(0.3);

    

    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
 
    return  Expanded( child:Padding( 
              padding:const EdgeInsets.only(
     left:2,
      right:2,
   
    ),
      
      child:new Container(
      width: _kDotSpacing,

      child: new Center(
        child: new Material(
            color:mainColor,
          type: MaterialType.card,
         
          child: new Container(
        
            height:3,
           
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    )));
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: 
      
      new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}




class DetailScreen extends StatelessWidget {

  
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 100);

  static const _kCurve = Curves.easeInOutQuart;

  final _kArrowColor = Colors.black.withOpacity(0.8);


  @override
  Widget build(BuildContext context) {
    final Photo todo = ModalRoute.of(context).settings.arguments;

    // Use the Todo to create the UI.
    return Scaffold(
           backgroundColor: Color(0xaa13213e),
    bottomNavigationBar: Padding (  padding: const EdgeInsets.all(12.0), child:ClipRRect(
  borderRadius: BorderRadius.circular(10.0), child:Container(
        color:  Color(0xff82cc00),
        height:50,
        width:double.infinity,
        child:     Center( 
            child: new FlatButton(
              
              onPressed: () => launch("tel:+380933887874"),
              child: Container(
        color:  Color(0xff82cc00),
        height:50,
        width:double.infinity,
        child:Center( 
            child: new Text("Передзвонити",style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20), textAlign: TextAlign.center)),
        ),))))),
      body: 
       



ListView(


       
  children: [

Stack(
  
 children: <Widget>[
ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 0),
        itemCount:1,
        shrinkWrap: true,
physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if(index % 2 == 0) {
            return _buildCarousel(context, 1);
          }
          else {
            return Divider();
          }
        },
      ),


 ]

),


Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:12,
      top: 12,
      right:4
   
    ),
      
      child:
      Text(
         todo.title,
             style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
          ),),
    ),

Row(
  mainAxisAlignment: MainAxisAlignment.start,
       
  children: [
   Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:12,
      top: 6,
   
    ),
      
      child:
      Text(
         '1 тиж. тому',
         
             style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 16),
             
          ),),
    ),

Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:8,
      top: 6,
   
    ),
      
      child:
      Text(
         '•',
             style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 16),
          ),),
    ),

     Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:8,
      top: 6,
   
    ),
      
      child:
      Text(
         '12 переглядив',
             style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 16),
          ),),
    ),


  ],
),



    Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:12,
      top: 20,
   
    ),
      
      child:
      Text(
         '155 696 грн',
    style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
          ),),
    ),




Row(
  mainAxisAlignment: MainAxisAlignment.start,
       
  children: [
   Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:12,
      top: 20,
   
    ),
      
      child:
     CircleAvatar(
                radius: 24,
                backgroundColor:  Color(0xff82cc00),
                child: IconButton(
  
  icon: new Icon(Icons.local_phone,   color: Colors.white,
      size: 26.0,
      semanticLabel: 'Звонок',), onPressed: () {
        launch("tel:+380933887874");
          },),
              ),),
    ),



     Align(
      alignment: Alignment.bottomLeft,
      child: 
       Padding( 
              padding:const EdgeInsets.only(
     left:12,
      top: 20,
   
    ),
      
      child:
   Column(

       crossAxisAlignment: CrossAxisAlignment.start,
  children: [
 
 
 
       Padding( 
              padding:const EdgeInsets.only(  left: 0,
   ),
      child:
      Text(
         'Слава', 
      style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 17), textAlign: TextAlign.left,
          ),),
 



     
       Padding( 
              padding:const EdgeInsets.only(
  left:0,
      top: 3,
   
    ),
      
      child:
      Text(
         '099 128 57 25',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 19),
          ),),
   


  ],
),),
    ),


  ],
),






    Padding( padding:const EdgeInsets.only(
     right:12,
      left: 12,
   top:16,
    ),
      
      child:ClipRRect(
  borderRadius: BorderRadius.circular(10.0), child:Container(
            color:Color(0xff264562),
            child: 
          
Table(
 
//          defaultColumnWidth:
//              FixedColumnWidth(MediaQuery.of(context).size.width / 3),
          border: TableBorder.all(
            
              color: Colors.black26, width: 1, style: BorderStyle.none),
          children: [
            TableRow(children: [
              TableCell(child:  Padding( padding:const EdgeInsets.only(
  top:18,
      left: 18,
   
    ),
      
      child: Text('Локація', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16)))),
              TableCell(child: Padding( padding:const EdgeInsets.only(
  top:18,
      right: 18,
        
   
    ),
      
      child: Text('Київ', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16)))),
            ]),
            TableRow(children: [
              TableCell(child: Padding( padding:const EdgeInsets.only(
  
      left: 18,
     top:18,
   
    ),child: Text("Кузов", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16)))),
              TableCell(
                child:Padding( padding:const EdgeInsets.only(
  top:18,
      right: 18,
    
   
    ),
      
      child: Text('Седан', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16))),
              ),
          
            ]),
            TableRow(children: [
              TableCell(
                child: Padding( padding:const EdgeInsets.only(
  top:18,
      left: 18,
   
    ),child: Text('Пробіг', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16))),
           
              ),
              TableCell(
              
                child:Padding( padding:const EdgeInsets.only(
  top:18,
      right: 18,
         
   
    ),
      
      child: Text('120 000 км', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16))),
              ),
        
            ]),
            TableRow(children: [
              TableCell(child: Padding( padding:const EdgeInsets.only(
  top:18,
      left: 18,
   
    ),child: Text('Топливо', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16)))),
              TableCell(
                child:Padding( padding:const EdgeInsets.only(
  top:18,
      right: 18,
        
   
    ),
      
      child:  Text('Бензин', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16)),
              )),
         
            ]),
            TableRow(children: [
              TableCell(child: Padding( padding:const EdgeInsets.only(
  
      left: 18,
     top:18,
   
    ),child: Text("Об'єм двигуна", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16)))),
              TableCell(
                child:Padding( padding:const EdgeInsets.only(
  top:18,
      right: 18,
    
   
    ),
      
      child: Text('1.6 л', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16))),
              ),
          
            ]),
            TableRow(children: [
              TableCell(child: Padding( padding:const EdgeInsets.only(
  
      left: 18,
     top:18,
   
    ),child: Text("Рік випуску", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16)))),
              TableCell(
                child:Padding( padding:const EdgeInsets.only(
  top:18,
      right: 18
   
    ),
      
      child: Text('1998', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16))),
              ),
          
            ]),
            TableRow(children: [
              TableCell(child: Padding( padding:const EdgeInsets.only(
  
      left: 18,
     top:18,
   
    ),child: Text("Коробка", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16)))),
              TableCell(
                child:Padding( padding:const EdgeInsets.only(
  top:18,
      right: 18
    ),
      
      child: Text('Автомат', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16))),
              ),
          
            ])
            ,
            TableRow(children: [
              TableCell(child: Padding( padding:const EdgeInsets.only(
  
      left: 18,
     top:18,
   
    ),child: Text("Привід", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16)))),
              TableCell(
                child:Padding( padding:const EdgeInsets.only(
  top:18,
      right: 18,
    
   
    ),
      
      child: Text('Повний', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16))),
              ),
          
            ]),
            TableRow(children: [
              TableCell(child: Padding( padding:const EdgeInsets.only(
  
      left: 18,
     top:18,
   
    ),child: Text("Колір", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16)))),
              TableCell(
                child:Padding( padding:const EdgeInsets.only(
  top:18,
      right: 18
    ),
      
      child: Text('Чорний', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16))),
              ),
          
            ])
            ,
            TableRow(children: [
              TableCell(child: Padding( padding:const EdgeInsets.only(
  
      left: 18,
     top:18,
   
    ),child: Text("Таможня", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16)))),
              TableCell(
                child:Padding( padding:const EdgeInsets.only(
  top:18,
      right: 18,
      bottom:18
   
    ),
      
      child: Text('Розмитнена', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16))),
              ),
          
            ])
          ],
        )))),
      


 Padding( padding:const EdgeInsets.only(
     right:12,
      left: 12,
      top:12,
      bottom:12
   
    ),
      
      child:ClipRRect(
  borderRadius: BorderRadius.circular(10.0), child:Container(
            color:Color(0xff264562),
            child:  Padding( padding:const EdgeInsets.only(
     right:18,
      left: 18,
      top:18,
      bottom:18
   
    ), child:Text('Рекордсменом по количеству букв в своем названии считается Бангкок (город даже отмечен в книге рекордов Гиннесса). И сразу же такая версия может показаться неправдоподобной, ведь в слове «Бангкок» всего лишь семь букв. Но это лишь сокращенный вариант, который принят для удобства произношения. Самое длинное название города звучит так: Крун Тхеп Маханахон Амон Ратанакосин Махинтараютхая Махадлок Пхоп Нопарат Рачатани Буриром Удомратчаниве Махасатан Амон Пиман Авата Сати Сакатхаттийя Витсанукам Прасит.', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16)))))),




  ])
    );

    
  }

  
  Widget _buildCarousel(BuildContext context, int carouselIndex) {
          final Photo todo = ModalRoute.of(context).settings.arguments;
             var arr = todo.thumbnailUrl.split(' ');
      final List<Widget> _pages = <Widget>[
    


       for(var i = 0; i < arr.length; i++)  
       new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child:
       
      Image.network(
             arr[i],
                 fit: BoxFit.fitHeight,
  width: double.infinity,
      )
          
    ),
       
       
  ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      




        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 500.0,
          child: 
          
          Stack(
  
 children: <Widget>[

        Hero(
          tag: 'imageHero' + todo.id.toString(),
          child: 
          PageView.builder(
            // store this controller in a State to save the carousel scroll position
           controller: _controller,
                itemCount:_pages.length,
            itemBuilder: (BuildContext context, int itemIndex) {
          return _pages[itemIndex % _pages.length];
            },)),
          Positioned(
              top: 15.0,
              left: 15.0,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.black.withOpacity(0.8),
                child: IconButton(
  
  icon: new Icon(Icons.close,   color: Colors.white,
      size: 18,
      semanticLabel: 'Назад',), onPressed: () {
            Navigator.pop(context);
          },),
              ),
),
            Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding( 
              padding:const EdgeInsets.only(
     left:10,
      right:10,
   
    ),
      
      child: new Container(
                height:15,
                child:  new DotsIndicator(
                    
                   
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

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
        final Photo todo = ModalRoute.of(context).settings.arguments;
    return  Container(
      child:Image.network(
             'https://cdn.motor1.com/images/mgl/zZnP8/s3/2020-rimac-c-two.jpg',
                 fit: BoxFit.fitHeight,
  width: double.infinity,

            ),
            
      );
    
  }
}




import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timosh_app/DataList.dart';
import 'package:timosh_app/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timosh_app/DataList.dart';
import 'package:timosh_app/providers/Sort.dart';



/*
class SearchBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search App'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch(listWords));
              })
        ],
      ),
      body: Center(
          child: Text('default content')
      ),
      drawer: Drawer(),
    );
  }
}
*/

class DataSearch extends SearchDelegate<String> {
String a;
  final List<ListWords> listWords;

 
final String searchFieldLabel = "Марка чи модель авто";
  DataSearch(this.listWords);

@override
  void set query(String value) {
    // TODO: implement query
    super.query = savesearch;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = '';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
          savesearch = query;
        });
  }

ThemeData appBarTheme(BuildContext context) {
  
  assert(context != null);
  final ThemeData theme = Theme.of(context);

  assert(theme != null);
  return theme.copyWith(
backgroundColor: Colors.red,

inputDecorationTheme: InputDecorationTheme(hintStyle: Theme.of(context).textTheme.title.copyWith(color: Colors.grey)),
    primaryColor: Color(0xff183047),


    textTheme: theme.textTheme.copyWith(title: theme.textTheme.title.copyWith(color: theme.primaryTextTheme.title.color)),
    primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
    primaryColorBrightness: Brightness.dark,
    primaryTextTheme: theme.textTheme,
    brightness: Brightness.dark,
    accentColor: Colors.red,

primaryColorDark: Colors.red,
    scaffoldBackgroundColor: Colors.red
  );
}


  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? listWords
        : listWords.where((p) => p.titlelist.contains(RegExp(query, caseSensitive: false))).toList();
  
 
    return Scaffold(
        backgroundColor: Color(0xaa15202b),
        body:Ink(
   color: Color(0xff183047),
  child: 
 ListView.builder( itemBuilder: (context, index) => ListTile(
      
      onTap: () {
 close(context, "yes");
 savesearch = query;
         /*
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(listWordsDetail: suggestionList[index]),
          ),
          
        );*/
        
        
        categories = suggestionList[index].model;
       
        print(suggestionList[index].model);
         print(categories);
               },
               
               trailing: Icon(Icons.remove_red_eye),
               title: RichText(
                 text: TextSpan(
                     text: suggestionList[index].definitionlist.substring(0, query.length),
                     style: TextStyle(
                         color: Colors.white),
                     children: [
                       TextSpan(
                           text: suggestionList[index].definitionlist.substring(query.length),
                           style: TextStyle(color: Colors.white)),
                     ]),
               ),
             ),
               itemCount: suggestionList.length,
             )));
           }
         
         
         
         
         
         
         
         
         
           @override
           Widget buildResults(BuildContext context) {
         
         
         
             final suggestionList = query.isEmpty
                 ? listWords
                 : listWords.where((p) => p.titlelist.contains(RegExp(query, caseSensitive: false))).toList();
         
         
             return ListView.builder( itemBuilder: (context, index) => ListTile(
               
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => Detail(listWordsDetail: suggestionList[index]),
                   ),
                 );
               },
               trailing: Icon(Icons.remove_red_eye),
               
               title: RichText(
                 
                 text: TextSpan(
                     text: suggestionList[index].definitionlist.substring(0, query.length),
                     
                     style: TextStyle(
                         color: Colors.white),
                     children: [
                       TextSpan(
                         
                           text: suggestionList[index].definitionlist.substring(query.length),
                           style: TextStyle(color: Colors.white, backgroundColor: Colors.red)),
                     ]),
               ),
             ),
               itemCount: suggestionList.length,
             );
           }
         
         


}
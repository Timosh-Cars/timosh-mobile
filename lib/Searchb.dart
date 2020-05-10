import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timosh_app/DataList.dart';
import 'package:flutter/cupertino.dart';
import 'package:timosh_app/providers/Sort.dart';



class DataSearch extends SearchDelegate<String> {
  String a;
  final List<ListWords> listWords;

  final String searchFieldLabel = "Марка чи модель авто";
  DataSearch(this.listWords);

  @override
  set query(String value) {
    super.query = savesearch;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
            savesearch = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
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
      backgroundColor: Color(0xaa15202b),
      textTheme: TextTheme(
        
        headline: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.grey, fontFamily: 'Raleway'),
            caption: TextStyle(   fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.grey, fontFamily: 'Raleway'),
             subtitle: TextStyle(   fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.grey, fontFamily: 'Raleway'),
        title: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal, fontFamily: 'Raleway'),
        body1: TextStyle(fontSize: 16.0, fontFamily: 'Raleway'),
      ),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle:
              Theme.of(context).textTheme.title.copyWith(color: Colors.grey)),
      primaryColor: Color(0xaa15202b),
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.dark,
      primaryTextTheme: theme.textTheme,
      brightness: Brightness.dark,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? listWords
        : listWords
            .where((p) =>
                p.titlelist.contains(RegExp(query, caseSensitive: false)))
            .toList();

    return Ink(
        color: Color(0xaa15202b),
        child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    close(context,'');
                    savesearch = suggestionList[index].definitionlist;
                    offset = 1;
                    currentPage=0;
                    /*
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(listWordsDetail: suggestionList[index]),
          ),
          
        );*/

                    categories = suggestionList[index].model;
                  },

                  //trailing: Icon(Icons.remove_red_eye),
                  title: Text(
                    suggestionList[index].definitionlist,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14),
                  ),
                ),
            itemCount:
                suggestionList.length < 10 ? suggestionList.length : 10));
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = query.isEmpty
        ? listWords
        : listWords
            .where((p) =>
                p.titlelist.contains(RegExp(query, caseSensitive: false)))
            .toList();

    return Ink(
        color: Color(0xaa15202b),
        child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
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
                  },

                  //trailing: Icon(Icons.remove_red_eye),
                  title: Text(
                    suggestionList[index].definitionlist,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14),
                  ),
                ),
            itemCount:
                suggestionList.length < 10 ? suggestionList.length : 10));
  }
}

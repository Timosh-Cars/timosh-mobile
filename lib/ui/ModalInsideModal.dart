import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalInsideModal extends StatelessWidget {
  final ScrollController scrollController;

  const ModalInsideModal({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
    elevation: 18.0,
        child: CupertinoPageScaffold(
          
      navigationBar: CupertinoNavigationBar(
        
          leading: Container(), middle: Text('Modal Page')),
      child: SafeArea(
        bottom: false,
        child: ListView(
          
          shrinkWrap: true,
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          children: ListTile.divideTiles(
              context: context,
              tiles: List.generate(
                100,
                (index) => ListTile(
                    title: Text('Item'),
                    onTap: () => showCupertinoModalBottomSheet(
                          expand: true,
                          isDismissible: false,
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context, scrollController) =>
                              ModalInsideModal(
                                  scrollController: scrollController),
                        )),
              )).toList(),
        ),
      ),
    ));
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
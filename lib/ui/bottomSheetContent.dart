import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      child: Column(
        children: [
          Container(
            height: 70,
            child: Center(
              child: Text(
                'Фільтр',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 24),
              ),
            ),
          ),
          Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 21,
              itemBuilder: (context, index) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                top: 6,
                              ),
                              child: Chip(
                                avatar: CircleAvatar(
                                  backgroundColor: Colors.grey.shade800,
                                  child: Text('O'),
                                ),
                                label: Text('Бензин'),
                              )))
                    ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
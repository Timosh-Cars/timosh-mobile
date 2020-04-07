import 'package:flutter/material.dart';
import 'package:timosh_app/models/car.dart';
import 'package:transparent_image/transparent_image.dart';

import 'detailsPage.dart';

class CarsList extends StatelessWidget {
  final List<Car> cars;

  CarsList({Key key, this.cars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(),
              settings: RouteSettings(
                arguments: cars[index],
              ),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 20,
                  right: 12,
                ),
                // handle your onTap here
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Hero(
                        tag: 'imageHero' + cars[index].id.toString(),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: cars[index].attributes[16].options[0].split(' ')[0],
                          fit: BoxFit.fitWidth,
                          height: 300,
                          width: double.infinity,
                        ))),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 6,
                    top: 8,
                  ),
                  child: Text(
                    cars[index].name,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 19),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 6,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "${cars[index].attributes[0].options[0]} км.",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      )
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 6,
                      ),
                      child: Text(
                        '•',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 6,
                      ),
                      child: Text(
                        cars[index].attributes[6].options[0],
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 6,
                      ),
                      child: Text(
                        '•',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 6,
                      ),
                      child: Text(
                        cars[index].attributes[5].options[0],
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 6,
                      ),
                      child: Text(
                        '•',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 6,
                      ),
                      child: Text(
                        cars[index].attributes[4].options[0],
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 6,
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 16.0,
                        semanticLabel: 'Локация',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 4,
                        top: 6,
                      ),
                      child: Text(
                        cars[index].attributes[3].options[0],
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          top: 6,
                        ),
                        child: Text(
                          "${cars[index].price} грн",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 19),
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 12,
                        top: 6,
                      ),
                      child: Text(
                        "some time ago",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 15),
                      ),
                    ),
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
import 'package:flutter/material.dart';

class PlanetItem {
  final String title;
  final String urlImage;
  final String info;
  final List distance;

  PlanetItem(
      {required this.title,
      required this.urlImage,
      required this.info,
      required this.distance});
}

final planetList = <PlanetItem>[
  PlanetItem(
    title: 'Меркурий',
    urlImage: 'assets/images/paris.jpg',
    info:
        'Самая маленькая планета Солнечной системы имеет радиус всего 2440 км. ',
    distance: ['25000', 'qwe'],
  ),
  PlanetItem(
      title: 'Венера',
      urlImage: 'assets/images/london.jpg',
      info:
          'Вторая от Солнца планета, атмосфера которой почти полностью состоит из углекислого газа.',
      distance: ['15000', 'ghj']),
  PlanetItem(
    title: 'Земля',
    urlImage: 'assets/images/moscow.jpg',
    info:
        'Третья планета от Солнца и единственная в нашей системе, где на поверхности есть жидкая вода, без которой не смогла бы развиться жизнь на планете.',
    distance: ['10000', 'kjh'],
  ),
  PlanetItem(
      title: 'Марс',
      urlImage: 'assets/images/berlin.jpg',
      info:
          'Четвёртая планета от Солнца, известная своей разрежённой атмосферой.',
      distance: ['5000', 'kjh']),
];

// import 'dart:html';
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:week_13/info.dart';

class ViewItem {
  final String title;
  final String urlImage;
  final String? info;

  ViewItem({required this.title, required this.urlImage, this.info});
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late String valueChoose;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.grey),
        centerTitle: true,
        title: const Text(
          'Планеты',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 71, 109, 139)),
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: planetList.length,
            itemBuilder: (context, index) {
              final planet = planetList[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: 50,
                      height: 50,
                      child: Hero(
                          tag: planet
                              .title, //в качестве тэга будем использовать название достопримечательности
                          child: Image(image: AssetImage(planet.urlImage)))),

                  // Text(
                  //   planet.title,
                  //   style: const TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  // DropdownButton(
                  //   onChanged: (newValue) {},
                  //   items: planet.distance.map((valueItem) {
                  //     return DropdownMenuItem(
                  //       value: valueItem,
                  //       child: Text(valueItem),
                  //     );
                  //   }).toList(),
                  // )
                ],
              );
            }),
      ),
    ));
  }
}

ExpansionPanel planet(header) {
  return ExpansionPanel(
      headerBuilder: (context, isOpen) {
        return Text('header');
      },
      body: Text('qweq'),
      isExpanded: true);
}

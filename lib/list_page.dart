// import 'dart:html';
// import 'dart:ui';

// simport 'dart:html';

import 'package:flutter/material.dart';
import 'package:week_13/info.dart';
import 'package:week_13/planet_item.dart';

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

class _ListPageState extends State<ListPage>
    with SingleTickerProviderStateMixin {
  List boolList = List.filled(planetList.length, false);
  late AnimationController _controller;
  late AnimationController _controllerDropDown;

  late final Animation<double> _animation;
  late final Animation<double> _animationDropDown;

  callBack(index, bool isShow) {
    setState(() {
      boolList[index].isShow = !isShow;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _animationDropDown = Tween(begin: 0.0, end: 0.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              return PlanetItem(
                title: planet.title,
                urlImage: planet.urlImage,
                info: planet.info,
                note: planet.note,
              );
              //  Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //         margin: const EdgeInsets.only(right: 15),
              //         width: 50,
              //         height: 50,
              //         child: Hero(
              //             tag: planet
              //                 .title, //в качестве тэга будем использовать название достопримечательности
              //             child: Image(image: AssetImage(planet.urlImage)))),
              //     Container(
              //       width: MediaQuery.of(context).size.width / 3 * 2, //change
              //       child: Column(
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(planet.title),
              //               Container(
              //                 child: RotationTransition(
              //                   turns: _animationDropDown,
              //                   child: GestureDetector(
              //                     onTap: () {
              //                       // boolList[index] = !boolList[index];
              //                       setState(() {
              //                         // boolList[index] = !boolList[index];
              //                         planet.isShow = !planet.isShow;
              //                       });
              //                       // if (boolList[index]) {
              //                       //   _controller.forward();
              //                       // } else {
              //                       //   _controller.reverse();
              //                       // }
              //                       planet.isShow
              //                           ? _controller.forward()
              //                           : _controller.reverse();
              //                       print(planet.isShow);
              //                     },
              //                     child: const Icon(Icons.expand_more),
              //                   ),
              //                   // child: IconButton(
              //                   //     onPressed: () {
              //                   //       showPicker = !showPicker;
              //                   //       if (showPicker) {
              //                   //         _controller.forward();
              //                   //       } else {
              //                   //         _controller.reverse();
              //                   //       }
              //                   //     },
              //                   //     icon: Icon(Icons.expand_more)),
              //                 ),
              //               )
              //             ],
              //           ),
              //           SizeTransition(
              //             sizeFactor: _controller,
              //             axis: Axis.vertical,
              //             child: Container(
              //                 height: 50,
              //                 width: MediaQuery.of(context).size.width / 3 * 2,
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(planet.note[0]),
              //                     Text(planet.note[1])
              //                   ],
              //                 )),
              //           )
              //           // Container(
              //           //     height: 50,
              //           //     width: MediaQuery.of(context).size.width / 3 * 2,
              //           //     child: Column(
              //           //       crossAxisAlignment: CrossAxisAlignment.start,
              //           //       children: [
              //           //         Text(planet.note[0]),
              //           //         Text(planet.note[1])
              //           //       ],
              //           //     )),
              //         ],
              //       ),
              //     ),
              //   ],
              // );
            }),
      ),
    ));
  }
}

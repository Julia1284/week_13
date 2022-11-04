import 'package:flutter/material.dart';
import 'package:week_13/info.dart';
import 'package:week_13/planet_page.dart';

class PlanetItem extends StatefulWidget {
  final String title;
  final String urlImage;
  final String info;
  final List note;
  // final int index;

  const PlanetItem(
      {required this.title,
      required this.urlImage,
      required this.info,
      required this.note,
      // required this.index,
      super.key});

  @override
  State<PlanetItem> createState() => _PlanetItemState();
}

class _PlanetItemState extends State<PlanetItem>
    with SingleTickerProviderStateMixin {
  bool showPicker = false;
  late AnimationController _controller;

  late final Animation<double> _animation;
  late final Animation<double> _animationDropDown;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          width: MediaQuery.of(context).size.width / 5,
          height: 70,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PlanetPage(
                        title: widget.title,
                        urlImage: widget.urlImage,
                        info: widget.info,
                      )));
            },
            child: Hero(
                tag: widget
                    .title, //в качестве тэга будем использовать название достопримечательности
                child: Image(
                  image: AssetImage(widget.urlImage),
                  fit: BoxFit.fill,
                )),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3 * 2, //change
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title),
                  RotationTransition(
                    turns: _animationDropDown,
                    child: GestureDetector(
                      onTap: () {
                        showPicker = !showPicker;
                        if (showPicker) {
                          _controller.forward();
                        } else {
                          _controller.reverse();
                        }
                      },
                      child: const Icon(Icons.expand_more),
                    ),
                  ),
                  // ElevatedButton(onPressed: () {}, child: Text('Больше')),
                ],
              ),
              SizeTransition(
                sizeFactor: _animation,
                axis: Axis.vertical,
                child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3 * 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(widget.note[0]), Text(widget.note[1])],
                    )),
              )
            ],
          ),
        ),
      ],
    );
    ;
  }
}

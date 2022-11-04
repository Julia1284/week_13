import 'package:flutter/material.dart';
import 'package:week_13/list_page.dart';

// поворот Земли с помощью RotationTransition
class HomePageTransition extends StatefulWidget {
  const HomePageTransition({super.key});

  @override
  State<HomePageTransition> createState() => _HomePageTransitionState();
}

class _HomePageTransitionState extends State<HomePageTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(minutes: 1))
          ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RotationTransition(
                turns: controller,
                alignment: Alignment.center,
                child:
                    const Image(image: AssetImage('assets/images/earth.png')),
              ),
              ElevatedButton(
                  onPressed: () {
                    onPressed:
                    () => Navigator.of(context).push(CustomPageRoute(
                          child: const ListPage(),
                        ));
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(color: Colors.grey),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;

  CustomPageRoute({
    required this.child,
  }) : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: animation,
        child: child,
      );
}

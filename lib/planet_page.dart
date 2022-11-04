import 'package:flutter/material.dart';

class PlanetPage extends StatelessWidget {
  final String title;
  final String urlImage;
  final String info;

  const PlanetPage(
      {required this.title,
      required this.urlImage,
      required this.info,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.grey),
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(15),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 71, 109, 139)),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Hero(tag: title, child: Image(image: AssetImage(urlImage))),
                  Text(info)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  // runSolutionOne();
  runSolutionTwo();
}

runSolutionOne() {
  runApp(SolutionOneApp());
}

runSolutionTwo() {
  runApp(SolutionTwoApp());
}

class SolutionOneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SolutionOneHomeScreen(),
    );
  }
}

class SolutionOneHomeScreen extends StatelessWidget {
  const SolutionOneHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      'assets/svg/fish.svg',
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Text('from assets'),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: SvgPicture.network(
                      'https://worldvectorlogo.com/download/flutter.svg',
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Text('from network'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SolutionTwoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SolutionTwoHomeScreen(),
    );
  }
}

class SolutionTwoHomeScreen extends StatelessWidget {
  const SolutionTwoHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Flutter Demo Home Page'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          final bgColor1 =
              Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);
          final bgColor2 =
              Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);
          return CarouselSlider(
              items: [
                Container(
                  alignment: Alignment.center,
                  color: bgColor1,
                  child: SvgPicture.asset(
                    'assets/svg/fish.svg',
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: bgColor2,
                  child: SvgPicture.network(
                    'https://worldvectorlogo.com/download/flutter.svg',
                    height: 50,
                    fit: BoxFit.cover,
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                  ),
                ),
              ],
              options: CarouselOptions(
                  height: constraints.constrainHeight(), viewportFraction: 1));
        }));
  }
}

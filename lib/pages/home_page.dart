import 'package:book_worm/widgets/homePage/book_section.dart';
import 'package:book_worm/widgets/homePage/header_carousel.dart';
import 'package:book_worm/widgets/homePage/header_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const HeaderWidget(),
          const SizedBox(height: 20),
          Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Popular Books',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          HeaderCarousel(),
          const BookSection()
        ],
      ),
    );
  }
}

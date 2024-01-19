import 'dart:developer';

import 'package:book_worm/constants/book_samples.dart';
import 'package:book_worm/widgets/homePage/book_section_body.dart';
import 'package:flutter/material.dart';

class BookSection extends StatefulWidget {
  const BookSection({Key? key}) : super(key: key);

  @override
  _BookSectionState createState() => _BookSectionState();
}

class _BookSectionState extends State<BookSection>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  late TabController _tabController;

  List<dynamic> options = [
    {'name': 'New', 'color': Colors.yellow[700]},
    {'name': 'Popular', 'color': Colors.red[400]},
    {'name': 'Trending', 'color': Colors.blue[300]},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: options.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NestedScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          log('innerBoxIsScrolled: $innerBoxIsScrolled');
          return [
            SliverAppBar(
              // flexibleSpace: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: options.map((e) {
              //     return Expanded(
              //       child: Container(
              //         margin: const EdgeInsets.symmetric(horizontal: 5),
              //         child: TextButton(
              //           onPressed: null,
              //           style: TextButton.styleFrom(
              //             backgroundColor: e['color'],
              //             shape: const BeveledRectangleBorder(),
              //           ),
              //           child: Text(e['name']),
              //         ),
              //       ),
              //     );
              //   }).toList(),
              // ),
              pinned: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(10),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TabBar(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey[300],
                    indicatorPadding: const EdgeInsets.only(right: 10),
                    labelPadding: const EdgeInsets.only(right: 10),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          // blurRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: options
                        .map(
                          (e) => BookTab(
                            name: e['name'],
                            color: e['color'],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children:
              options.map((e) => BookSectionBody(books: BOOK_SAMPLE)).toList(),
        ),
      ),
    );
  }
}

class BookTab extends StatelessWidget {
  final String name;
  final Color color;
  const BookTab({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              // blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
          // color: e['color'],
        ),
        child: Text(name),
      ),
    );
  }
}

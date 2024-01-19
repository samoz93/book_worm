import 'package:book_worm/models/book_model.dart';
import 'package:book_worm/providers/book_service.dart';
import 'package:flutter/material.dart';

class HeaderCarousel extends StatelessWidget {
  HeaderCarousel({
    super.key,
  });

  final data = BooksService().getBooks();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: FutureBuilder<List<BookModel>>(
          future: BooksService().getBooks(),
          initialData: const [],
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.error != null || snapshot.data == null) {
              return const Text('Error');
            }

            return PageView.builder(
              padEnds: false,
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (_, i) {
                final item = snapshot.data![i];
                return Container(
                  height: 180,
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        item.cover ?? '',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(item.name ?? ''),
                );
              },
              itemCount: snapshot.data!.length,
            );
          }),
    );
  }
}

import 'package:book_worm/models/book_model.dart';
import 'package:book_worm/utils/format.dart';
import 'package:flutter/material.dart';

ButtonStyle flatButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.black87,
  minimumSize: const Size(32, 32),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  backgroundColor: Colors.blue[300],
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
  ),
);

class BookSectionBody extends StatelessWidget {
  final List<BookModel> books;
  const BookSectionBody({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = books[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.network(
                  item.cover ?? '',
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? '',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      item.author ?? '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.star, size: 12, color: Colors.yellow[700]),
                        Text(
                          (item.votes ?? 0).formatK(),
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          style: flatButtonStyle,
                          onPressed: () {},
                          child: Text(
                            'Buy',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: books.length,
    );
  }
}

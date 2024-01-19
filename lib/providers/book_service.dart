import 'package:book_worm/constants/book_samples.dart';
import 'package:book_worm/models/book_model.dart';
import 'package:book_worm/utils/dio_client.dart';
import 'package:flutter/foundation.dart';

class BooksService {
  var cache = {};
  Future<List<BookModel>> getBooks({year = 2020, genre = 'romance'}) async {
    if (kDebugMode) return BOOK_SAMPLE;

    if (cache[genre] == null) {
      cache[genre] = {};
    }
    cache[genre] = {};

    if (cache[genre][year] == null || cache[genre][year].isEmpty) {
      try {
        final url = 'https://hapi-books.p.rapidapi.com/nominees/$genre/$year';
        final response = await dioBookClient.get<List<dynamic>>(url);
        cache[genre][year] =
            response.data?.map((e) => BookModel.fromJson(e)).toList() ?? [];
      } catch (e) {
        cache[genre][year] = BOOK_SAMPLE;
      }
    }

    return cache[genre][year];
  }
}

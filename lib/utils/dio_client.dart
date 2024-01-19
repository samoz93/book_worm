import 'package:dio/dio.dart';

final dioBookClient = Dio(BaseOptions(headers: {
  'X-RapidAPI-Key': const String.fromEnvironment('RAPID_API_KEY'),
  'X-RapidAPI-Host': const String.fromEnvironment('RAPID_API_HOST')
}));

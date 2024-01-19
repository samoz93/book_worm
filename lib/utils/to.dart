Future<(Exception?, T?)> to<T>(Function func) async {
  (Exception?, T?) result = (null, null);
  try {
    final data = await func() as T;
    result = (null, data);
  } on Exception catch (e) {
    print(e);
    result = (e, null);
  }

  return result;
}

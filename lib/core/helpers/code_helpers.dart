class CodeHelpers {
  static Map<K, List<T>> groupBy<T, K>(
    List<T> list,
    K Function(T) keySelector,
  ) {
    final Map<K, List<T>> result = {};
    for (var item in list) {
      final key = keySelector(item);
      result.putIfAbsent(key, () => []).add(item);
    }
    return result;
  }
}

abstract class Isqldatabase {
  Future<Object>? readData(var params);
  Future<bool> writeData(var params);
  Future<bool> open();
  Future<bool> close();
}

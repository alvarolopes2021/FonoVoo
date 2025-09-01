abstract class Isqldatabase {
  Future<Object>? readData(dynamic params);
  Future<bool> writeData(dynamic params);
  Future<bool> executeCommand(dynamic params);
  Future<bool> open();
  Future<bool> close();
}

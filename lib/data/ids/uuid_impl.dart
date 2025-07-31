import 'package:fonovoo/data/ids/iuuid.dart';
import 'package:uuid/uuid.dart';

class UuidImpl implements IIdService {
  Uuid uuid = Uuid();

  @override
  String generateId() {
    return uuid.v4();
  }
}

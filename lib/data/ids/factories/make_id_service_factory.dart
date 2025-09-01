import 'package:fonovoo/data/ids/iuuid.dart';
import 'package:fonovoo/data/ids/uuid_impl.dart';

IIdService get makeIdServiceFactory => UuidImpl();

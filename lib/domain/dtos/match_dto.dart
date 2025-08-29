import 'package:fonovoo/domain/enums/match_status.dart';

class MatchDto {
  String _id = "";
  MatchStatus _status = MatchStatus.Finished;

  MatchDto(String id, MatchStatus status) {
    _id = id;
    _status = status;
  }

  static MatchDto create(String id, MatchStatus status) {
    return MatchDto(id, status);
  }

  String getId() {
    return _id;
  }

  void setId(String id) {
    _id = id;
  }

  MatchStatus getMatchStatus() {
    return _status;
  }

  void updateStatus(MatchStatus status) {
    _status = status;
  }
}

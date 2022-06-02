import 'package:drift/drift.dart';

class Reservations extends Table {
  //PRIMARY KEY
  IntColumn get id => integer().autoIncrement()();

  // 이용가능한떄인지
  BoolColumn get open => boolean()();

  // 일정 날짜
  DateTimeColumn get date => dateTime()();

  // 시간
  IntColumn get time => integer()();

}